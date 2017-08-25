##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'SyncMapPermission' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_map_permissions("identity").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Permissions/identity',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "map_sid": "MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "identity",
          "read": true,
          "write": true,
          "manage": true,
          "url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Permissions/identity"
      }
      ]
    ))

    actual = @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_map_permissions("identity").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_map_permissions("identity").delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Permissions/identity',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_map_permissions("identity").delete()

    expect(actual).to eq(true)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_map_permissions.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Permissions',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "permissions": [],
          "meta": {
              "first_page_url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/sidOrUniqueName/Permissions?PageSize=50&Page=0",
              "key": "permissions",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/sidOrUniqueName/Permissions?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_map_permissions.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "permissions": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "map_sid": "MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "identity": "identity",
                  "read": true,
                  "write": true,
                  "manage": true,
                  "url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Permissions/identity"
              }
          ],
          "meta": {
              "first_page_url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/sidOrUniqueName/Permissions?PageSize=50&Page=0",
              "key": "permissions",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/sidOrUniqueName/Permissions?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_map_permissions.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                          .sync_map_permissions("identity").update(read: true, write: true, manage: true)
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {
        'Read' => true,
        'Write' => true,
        'Manage' => true,
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Permissions/identity',
        data: values,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "map_sid": "MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "identity",
          "read": true,
          "write": true,
          "manage": true,
          "url": "https://preview.twilio.com/Sync/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Maps/MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Permissions/identity"
      }
      ]
    ))

    actual = @client.preview.sync.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_maps("MPaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                 .sync_map_permissions("identity").update(read: true, write: true, manage: true)

    expect(actual).to_not eq(nil)
  end
end