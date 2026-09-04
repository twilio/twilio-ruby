require 'spec_helper'

# Forward compatibility of response models: the API can add fields, stop sending
# fields, or send values the SDK has never seen before, underneath a pinned SDK
# version, without breaking deserialization of the fields the SDK already knows
# about.
#
# Instances are built directly from a payload hash (mirroring how the generated
# List/Context classes feed the constructor after parsing the HTTP response), so
# no Holodeck mocking is required. Covers three shapes of generated response
# model:
#  - a flat (non-nested) response: MessageInstance
#  - a nested response (top-level resource): ChannelsSenderInstance
#  - a nested, operation-specific response with lists of objects: RecallInstance
describe 'ResponseForwardCompatibility' do
  ACCOUNT_SID = 'AC' + 'a' * 32
  MESSAGE_SID = 'SM' + 'a' * 32
  SENDER_SID = 'XE' + 'a' * 32
  STORE_ID = 'ST_' + 'a' * 26
  PROFILE_ID = 'PR_' + 'a' * 26

  # ---------------------------------------------------------------
  # Flat response model: MessageInstance
  # ---------------------------------------------------------------

  def base_message_payload
    {
      'account_sid' => ACCOUNT_SID,
      'body' => 'Hello owl',
      'direction' => 'outbound-api',
      'error_code' => 30007,
      'from' => '+14155552345',
      'price_unit' => 'USD',
      'sid' => MESSAGE_SID,
      'status' => 'sent',
      'subresource_uris' => {
        'media' => "/2010-04-01/Accounts/#{ACCOUNT_SID}/Messages/#{MESSAGE_SID}/Media.json",
      },
      'to' => '+14155552345',
    }
  end

  def build_message(payload)
    Twilio::REST::Api::V2010::AccountContext::MessageInstance.new(
      @client.api.v2010, payload, account_sid: ACCOUNT_SID, sid: MESSAGE_SID
    )
  end

  it 'ignores an unknown top-level field on a flat response' do
    payload = base_message_payload
    payload['delivery_channel'] = 'rcs'
    payload['engagement'] = { 'clicks' => 3, 'links' => [{ 'url' => 'https://twilio.com' }] }

    message = build_message(payload)

    expect(message.sid).to eq(MESSAGE_SID)
    expect(message.body).to eq('Hello owl')
    expect(message.status).to eq('sent')
  end

  it 'deserializes a removed field on a flat response to nil' do
    payload = base_message_payload
    payload.delete('body')
    payload.delete('status')
    payload.delete('subresource_uris')

    message = build_message(payload)

    expect(message.body).to be_nil
    expect(message.status).to be_nil
    expect(message.subresource_uris).to be_nil
    expect(message.sid).to eq(MESSAGE_SID)
  end

  it 'preserves an unknown status value on a flat response' do
    payload = base_message_payload
    payload['status'] = 'eagerly_delivered'

    message = build_message(payload)

    expect(message.status).to eq('eagerly_delivered')
  end

  it 'deserializes an empty payload to an all-nil flat resource' do
    message = build_message({})

    expect(message).to_not be_nil
    expect(message.sid).to be_nil
    expect(message.status).to be_nil
  end

  # ---------------------------------------------------------------
  # Nested response model: ChannelsSenderInstance
  # ---------------------------------------------------------------

  def base_sender_payload
    {
      'sid' => SENDER_SID,
      'status' => 'ONLINE',
      'configuration' => {
        'waba_id' => '1234567890',
        'verification_method' => 'sms',
      },
      'profile' => { 'name' => 'Owl Shop' },
      'offline_reasons' => [
        { 'code' => '63024', 'message' => 'Sender is offline' },
      ],
      'compliance' => {
        'countries' => [
          {
            'country' => 'US',
            'status' => 'ONLINE',
            'carriers' => [{ 'name' => 'AT&T', 'status' => 'APPROVED' }],
          },
        ],
      },
    }
  end

  def build_sender(payload)
    Twilio::REST::Messaging::V2::ChannelsSenderInstance.new(
      @client.messaging.v2, payload, sid: SENDER_SID
    )
  end

  it 'ignores an unknown field at a nested level' do
    payload = base_sender_payload
    payload['configuration']['waba_tier'] = 'TIER_2'
    payload['compliance']['countries'][0]['carriers'][0]['launch_date'] = '2025-03-01'

    sender = build_sender(payload)

    expect(sender.configuration['waba_id']).to eq('1234567890')
    expect(sender.compliance['countries'][0]['carriers'][0]['name']).to eq('AT&T')
  end

  it 'removes a field inside a nested object while its siblings survive' do
    payload = base_sender_payload
    payload['configuration'].delete('waba_id')
    payload['compliance']['countries'][0].delete('carriers')

    sender = build_sender(payload)

    expect(sender.configuration).to_not have_key('waba_id')
    expect(sender.configuration['verification_method']).to eq('sms')
    expect(sender.compliance['countries'][0]).to_not have_key('carriers')
    expect(sender.compliance['countries'][0]['country']).to eq('US')
  end

  it 'deserializes a removed whole nested object to nil' do
    payload = base_sender_payload
    payload.delete('configuration')
    payload.delete('compliance')

    sender = build_sender(payload)

    expect(sender.configuration).to be_nil
    expect(sender.compliance).to be_nil
    expect(sender.profile['name']).to eq('Owl Shop')
  end

  it 'keeps a new item appended to a nested list' do
    payload = base_sender_payload
    payload['offline_reasons'] << { 'code' => '63999', 'message' => 'Brand new reason', 'remediation' => 'Contact support' }

    sender = build_sender(payload)

    expect(sender.offline_reasons.length).to eq(2)
    expect(sender.offline_reasons[1]['message']).to eq('Brand new reason')
  end

  it 'preserves an unknown status value at a nested level' do
    payload = base_sender_payload
    payload['compliance']['countries'][0]['carriers'][0]['status'] = 'LAUNCHING'

    sender = build_sender(payload)

    expect(sender.compliance['countries'][0]['carriers'][0]['status']).to eq('LAUNCHING')
  end

  it 'raises for a truly unknown property, as opposed to an unknown JSON field' do
    sender = build_sender(base_sender_payload)

    expect { sender.non_existent_property }.to raise_error(NoMethodError)
  end

  # ---------------------------------------------------------------
  # Nested, operation-specific response model: RecallInstance
  # (ProfileCreateResource-equivalent is too thin - id/message only - so this
  # uses the Recall response instead: it carries lists of nested objects and an
  # object nested two levels deep, communications[]['author'].)
  # ---------------------------------------------------------------

  def base_recall_payload
    {
      'observations' => [
        { 'content' => 'Customer asked about owl feed', 'occurredAt' => '2026-01-01T00:00:00Z', 'id' => 'OB1' },
      ],
      'communications' => [
        {
          'id' => 'CM1',
          'content' => { 'text' => 'Hello, how can I help?' },
          'author' => { 'id' => 'PT1', 'name' => 'Agent Owl', 'channel' => 'SMS', 'type' => 'HUMAN_AGENT' },
          'channelId' => 'CH1',
        },
      ],
      'meta' => { 'queryTime' => 120 },
    }
  end

  def build_recall(payload)
    Twilio::REST::Memory::V1::RecallInstance.new(
      @client.memory.v1, payload, store_id: STORE_ID, profile_id: PROFILE_ID
    )
  end

  it 'ignores an unknown field at the parent level and at a nested level' do
    payload = base_recall_payload
    payload['queryId'] = 'QR1'
    payload['meta']['cacheHit'] = true
    payload['communications'][0]['deliveryReceipt'] = { 'seenAt' => '2026-01-01T00:01:00Z' }

    recall = build_recall(payload)

    expect(recall.meta['queryTime']).to eq(120)
    expect(recall.communications[0]['author']['name']).to eq('Agent Owl')
  end

  it 'deserializes a removed field at the parent level and inside a nested object to nil/absent' do
    payload = base_recall_payload
    payload.delete('meta')
    payload['communications'][0]['author'].delete('name')

    recall = build_recall(payload)

    expect(recall.meta).to be_nil
    expect(recall.communications[0]['author']).to_not have_key('name')
    expect(recall.communications[0]['author']['id']).to eq('PT1')
    expect(recall.communications[0]['author']['channel']).to eq('SMS')
  end

  it 'preserves an unknown enum-like value inside a nested list item' do
    payload = base_recall_payload
    payload['communications'][0]['author']['channel'] = 'RCS_BUSINESS_MESSAGING'

    recall = build_recall(payload)

    expect(recall.communications[0]['author']['channel']).to eq('RCS_BUSINESS_MESSAGING')
  end
end
