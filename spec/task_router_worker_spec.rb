require 'spec_helper'

describe Twilio::TaskRouter::WorkerCapability do
  describe 'with a capability' do
    before :each do
      @capability = Twilio::TaskRouter::WorkerCapability.new 'AC123', 'foobar', 'WS456', 'WK789'
    end

    it 'should return a valid jwt when #generate_token is called' do
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      expect(decoded['policies']).not_to be_nil
      expect(decoded['iss']).not_to be_nil
      expect(decoded['exp']).not_to be_nil
      expect(decoded['account_sid']).to eq('AC123')
      expect(decoded['workspace_sid']).to eq('WS456')
      expect(decoded['worker_sid']).to eq('WK789')
      expect(decoded['channel']).to eq('WK789')
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
      expect(decoded['policies'].size).to eq(6)
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

      worker_fetch_policy = {
          'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Workers/WK789',
          'method' => 'GET',
          'query_filter' => {},
          'post_filter' => {},
          'allow' => true
      }
      expect(decoded['policies'][2]).to eq(worker_fetch_policy)

      activities_policy = {
        'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Activities',
        'method' => 'GET',
        'query_filter' => {},
        'post_filter' => {},
        'allow' => true
      }
      expect(decoded['policies'][3]).to eq(activities_policy)

      tasks_policy = {
          'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Tasks/**',
          'method' => 'GET',
          'query_filter' => {},
          'post_filter' => {},
          'allow' => true
      }
      expect(decoded['policies'][4]).to eq(tasks_policy)

      worker_reservations_policy = {
          'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Workers/WK789/Reservations/**',
          'method' => 'GET',
          'query_filter' => {},
          'post_filter' => {},
          'allow' => true
      }
      expect(decoded['policies'][5]).to eq(worker_reservations_policy)
    end

    it 'should add a policy when #allow_activity_updates is called' do
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      policies_size = decoded['policies'].size

      @capability.allow_activity_updates
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      activity_policy = {
        'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Workers/WK789',
        'method' => 'POST',
        'query_filter' => {},
        'post_filter' => {'ActivitySid' => {'required' => true}},
        'allow' => true
      }
      expect(decoded['policies'][-1]).to eq(activity_policy)
      expect(decoded['policies'].size).to eq(policies_size+1)
    end

    it 'should add two policies when #allow_reservation_updates is called' do
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      policies_size = decoded['policies'].size

      @capability.allow_reservation_updates
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      tasks_policy = {
        'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Tasks/**',
        'method' => 'POST',
        'query_filter' => {},
        'post_filter' => {},
        'allow' => true
      }
      expect(decoded['policies'][-2]).to eq(tasks_policy)
      worker_reservations_policy = {
          'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Workers/WK789/Reservations/**',
          'method' => 'POST',
          'query_filter' => {},
          'post_filter' => {},
          'allow' => true
      }
      expect(decoded['policies'][-1]).to eq(worker_reservations_policy)
      expect(decoded['policies'].size).to eq(policies_size+2)
    end
  end
end
