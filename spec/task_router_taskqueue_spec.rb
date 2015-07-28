require 'spec_helper'

describe Twilio::TaskRouter::Capability do
  describe 'with a capability' do
    before :each do
      @capability = Twilio::TaskRouter::TaskQueueCapability.new 'AC123', 'foobar', 'WS456', 'WQ789'
    end

    it 'should return a valid jwt when #generate_token is called' do
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      expect(decoded['policies']).not_to be_nil
      expect(decoded['iss']).not_to be_nil
      expect(decoded['exp']).not_to be_nil
      expect(decoded['account_sid']).to eq('AC123')
      expect(decoded['workspace_sid']).to eq('WS456')
      expect(decoded['taskqueue_sid']).to eq('WQ789')
      expect(decoded['channel']).to eq('WQ789')
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

    it 'should allow websocket operations and fetching the workspace by default' do
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      expect(decoded['policies'].size).to eq(3)
      get_policy = {
        "url" => 'https://event-bridge.twilio.com/v1/wschannels/AC123/WQ789',
        "method" => 'GET',
        "query_filter" => {},
        "post_filter" => {},
        "allow" => true
      }
      expect(decoded['policies'][0]).to eq(get_policy)
      post_policy = {
        "url" => 'https://event-bridge.twilio.com/v1/wschannels/AC123/WQ789',
        "method" => 'POST',
        "query_filter" => {},
        "post_filter" => {},
        "allow" => true
      }
      expect(decoded['policies'][1]).to eq(post_policy)

      taskqueue_fetch_policy = {
          'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/TaskQueues/WQ789',
          'method' => 'GET',
          'query_filter' => {},
          'post_filter' => {},
          'allow' => true
      }
      expect(decoded['policies'][2]).to eq(taskqueue_fetch_policy)
    end

    it 'should add a policy when #allow_fetch_subresources is called' do
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      policies_size = decoded['policies'].size

      @capability.allow_fetch_subresources
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      taskqueue_fetch_policy = {
        'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/TaskQueues/WQ789/**',
        'method' => 'GET',
        'query_filter' => {},
        'post_filter' => {},
        'allow' => true
      }
      expect(decoded['policies'][-1]).to eq(taskqueue_fetch_policy)
      expect(decoded['policies'].size).to eq(policies_size+1)
    end

    it 'should add a policy when #allow_update_subresources is called' do
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      policies_size = decoded['policies'].size

      @capability.allow_updates_subresources
      token = @capability.generate_token
      decoded, header = JWT.decode token, 'foobar'
      taskqueue_update_policy = {
        'url' => 'https://taskrouter.twilio.com/v1/Workspaces/WS456/TaskQueues/WQ789/**',
        'method' => 'POST',
        'query_filter' => {},
        'post_filter' => {},
        'allow' => true
      }
      expect(decoded['policies'][-1]).to eq(taskqueue_update_policy)
      expect(decoded['policies'].size).to eq(policies_size+1)
    end
  end
end
