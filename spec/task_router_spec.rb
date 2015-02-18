require 'spec_helper'

describe Twilio::TaskRouter::Capability do
  describe 'with a capability' do
    before :each do
      @capability = Twilio::TaskRouter::Capability.new 'AC123', 'foobar', 'WS456', 'WK789'
    end

    it 'should return a valid jwt when #generate_token is called' do
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      expect(decoded['policies']).not_to be_nil
      expect(decoded['iss']).not_to be_nil
      expect(decoded['exp']).not_to be_nil
    end

    it 'should properly set the iss key in the payload' do
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      expect(decoded['iss']).to eq('AC123')
    end

    it 'should properly set exp based on the default 1-hour ttl' do
      seconds = Time.now.to_i
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      expect(decoded['exp']).to eq(seconds + 3600)
    end

    it 'should properly set exp based on the ttl arg to #generate_token' do
      seconds = Time.now.to_i
      ttl = rand 10000
      token = @capability.generate_token ttl
      decoded, header = JWT.decode token, 'foobar'
      expect(decoded['exp']).to eq(seconds + ttl)
    end

    it 'should allow websocket operations and activity list fetches by default' do
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      expect(decoded['policies'].size).to eq(3)
      get_policy = {
        "url" => 'https://event-bridge.twilio.com/v1/wschannels/AC123/WK789',
        "method" => 'GET',
        "query_filter" => {},
        "post_filter" => {},
        "allow" => true
      }
      expect(decoded['policies'][0]).to eq(get_policy)
      post_policy = {
        "url" => 'https://event-bridge.twilio.com/v1/wschannels/AC123/WK789',
        "method" => 'POST',
        "query_filter" => {},
        "post_filter" => {},
        "allow" => true
      }
      expect(decoded['policies'][1]).to eq(post_policy)

      activities_policy = {
        'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Activities',
        'method' => 'GET',
        'query_filter' => {},
        'post_filter' => {},
        'allow' => true
      }
      expect(decoded['policies'][2]).to eq(activities_policy)
    end

    it 'should add a policy when #allow_worker_activity_updates is called' do
      @capability.allow_worker_activity_updates
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      expect(decoded['policies'].size).to eq(4)
      activity_policy = {
        'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Workers/WK789',
        'method' => 'POST',
        'query_filter' => {},
        'post_filter' => {'ActivitySid' => {'required' => true}},
        'allow' => true
      }
      expect(decoded['policies'][-1]).to eq(activity_policy)
    end

    it 'should add a policy when #allow_worker_fetch_attributes is called' do
      @capability.allow_worker_fetch_attributes
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      expect(decoded['policies'].size).to eq(4)
      worker_policy = {
        'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Workers/WK789',
        'method' => 'GET',
        'query_filter' => {},
        'post_filter' => {},
        'allow' => true
      }
      expect(decoded['policies'][-1]).to eq(worker_policy)
    end

    it 'should add a policy when #allow_task_reservation_updates is called' do
      @capability.allow_task_reservation_updates
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      expect(decoded['policies'].size).to eq(4)
      task_policy = {
        'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Tasks/**',
        'method' => 'POST',
        'query_filter' => {},
        'post_filter' => {'ReservationStatus' => {'required' => true}},
        'allow' => true
      }
      expect(decoded['policies'][-1]).to eq(task_policy)
    end
  end
end
