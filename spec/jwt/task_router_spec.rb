require 'spec_helper'

describe 'TaskRouter ' do
  def check_policy(method, url, policy, post_filter: {}, query_filter: {}, allow: true)
    expect(policy['url']).to eq(url)
    expect(policy['method']).to eq(method)
    expect(policy['post_filter']).to eq(post_filter)
    expect(policy['query_filter']).to eq(query_filter)
    expect(policy['allow']).to eq(allow)
  end

  describe Twilio::JWT::WorkerCapability do
    describe 'initialization' do
      before :each do
        @workerCapability = Twilio::JWT::WorkerCapability.new 'AC123', 'secret', 'WS456', 'WK123'
      end

      it 'should generate token' do
        token = @workerCapability.to_s
        payload, _ = JWT.decode token, 'secret'

        expect(payload['iss']).to eq('AC123')
        expect(payload['workspace_sid']).to eq('WS456')
        expect(payload['worker_sid']).to eq('WK123')
        expect(payload['policies']).not_to be_nil
      end

      it 'generate default' do
        token = @workerCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        expect(payload['iss']).to eq('AC123')
        expect(payload['workspace_sid']).to eq('WS456')
        expect(payload['policies']).not_to be_nil

        expect(payload['policies']).not_to be_nil
        policies = payload['policies']

        expect(policies.size).to eq(6)
        self.check_policy('GET', 'https://event-bridge.twilio.com/v1/wschannels/AC123/WK123', policies[0])
        self.check_policy('POST', 'https://event-bridge.twilio.com/v1/wschannels/AC123/WK123', policies[1])
        self.check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Workers/WK123', policies[2])
        self.check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Tasks/**', policies[3])
        self.check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Activities', policies[4])
        self.check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Workers/WK123/Reservations/**', policies[5])
      end

      it 'allow update activities' do
        @workerCapability.allow_update_activities
        token = @workerCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        expect(payload['iss']).to eq('AC123')
        expect(payload['workspace_sid']).to eq('WS456')
        expect(payload['policies']).not_to be_nil

        expect(payload['policies']).not_to be_nil
        policies = payload['policies']

        expect(policies.size).to eq(7)
        self.check_policy('POST',
                          'https://taskrouter.twilio.com/v1/Workspaces/WS456/Activities',
                          policies[6],
                          post_filter: {'ActivitySid' => {'required' => true}}
        )
      end

      it 'allow update worker reservations' do
        @workerCapability.allow_update_worker_reservations
        token = @workerCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        expect(payload['iss']).to eq('AC123')
        expect(payload['workspace_sid']).to eq('WS456')
        expect(payload['policies']).not_to be_nil

        expect(payload['policies']).not_to be_nil
        policies = payload['policies']

        expect(policies.size).to eq(8)
        self.check_policy('POST', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Tasks/**', policies[6])
        self.check_policy('POST', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/Workers/WK123/Reservations/**', policies[7])
      end
    end

    describe 'allow policies from constructor' do
      it 'optionals for policy' do
        @workerCapability = Twilio::JWT::WorkerCapability.new 'AC123', 'secret', 'WS456', 'WK123', allow_update_activities: true
        token = @workerCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        policies = payload['policies']
        expect(policies.size).to eq(7)
        self.check_policy('POST',
                          'https://taskrouter.twilio.com/v1/Workspaces/WS456/Activities',
                          policies[6],
                          post_filter: {'ActivitySid' => {'required' => true}}
        )
      end
    end
  end

  describe Twilio::JWT::TaskQueueCapability do
    describe 'initialization' do
      before :each do
        @taskQueueCapability = Twilio::JWT::TaskQueueCapability.new 'AC123', 'secret', 'WS456', 'WQ123'
      end

      it 'should generate token' do
        token = @taskQueueCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        expect(payload['iss']).to eq('AC123')
        expect(payload['workspace_sid']).to eq('WS456')
        expect(payload['channel']).to eq('WQ123')
        expect(payload['policies']).not_to be_nil
      end

      it 'generate default' do
        token = @taskQueueCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        expect(payload['iss']).to eq('AC123')
        expect(payload['workspace_sid']).to eq('WS456')
        expect(payload['channel']).to eq('WQ123')

        expect(payload['policies']).not_to be_nil
        policies = payload['policies']

        expect(policies.size).to eq(3)

        self.check_policy('GET', 'https://event-bridge.twilio.com/v1/wschannels/AC123/WQ123', policies[0])
        self.check_policy('POST', 'https://event-bridge.twilio.com/v1/wschannels/AC123/WQ123', policies[1])
        self.check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/TaskQueues/WQ123', policies[2])
      end

      it 'allow delete' do
        @taskQueueCapability.allow_delete
        token = @taskQueueCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        policies = payload['policies']

        expect(policies.size).to eq(4)
        self.check_policy('DELETE', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/TaskQueues/WQ123', policies[3])
      end

      it 'allow fetch subresources' do
        @taskQueueCapability.allow_fetch_subresources
        token = @taskQueueCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        policies = payload['policies']

        expect(policies.size).to eq(4)
        self.check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/TaskQueues/WQ123/**', policies[3])
      end

      it 'allow update subresources' do
        @taskQueueCapability.allow_updates_subresources
        token = @taskQueueCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        policies = payload['policies']

        expect(policies.size).to eq(4)
        self.check_policy('POST', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/TaskQueues/WQ123/**', policies[3])
      end

      it 'allow delete subresources' do
        @taskQueueCapability.allow_delete_subresources
        token = @taskQueueCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        policies = payload['policies']

        expect(policies.size).to eq(4)
        self.check_policy('DELETE', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/TaskQueues/WQ123/**', policies[3])
      end
    end

    describe 'allow policies from constructor' do
      it 'optionals for policy' do
        @taskQueueCapability = Twilio::JWT::TaskQueueCapability.new 'AC123', 'secret', 'WS456', 'WQ123', allow_delete: true
        token = @taskQueueCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        policies = payload['policies']

        expect(policies.size).to eq(4)
        self.check_policy('DELETE', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/TaskQueues/WQ123', policies[3])
      end
    end
  end

  describe Twilio::JWT::WorkspaceCapability do
    describe 'initialization' do
      before :each do
        @workspaceCapability = Twilio::JWT::WorkspaceCapability.new 'AC123', 'secret', 'WS456'
      end

      it 'should generate token' do
        token = @workspaceCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        expect(payload['iss']).to eq('AC123')
        expect(payload['workspace_sid']).to eq('WS456')
        expect(payload['policies']).not_to be_nil
      end

      it 'generate default' do
        token = @workspaceCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        expect(payload['iss']).to eq('AC123')
        expect(payload['workspace_sid']).to eq('WS456')

        expect(payload['policies']).not_to be_nil
        policies = payload['policies']

        expect(policies.size).to eq(3)
        self.check_policy('GET', 'https://event-bridge.twilio.com/v1/wschannels/AC123/WS456', policies[0])
        self.check_policy('POST', 'https://event-bridge.twilio.com/v1/wschannels/AC123/WS456', policies[1])
        self.check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WS456', policies[2])
      end

      it 'allow delete' do
        @workspaceCapability.allow_delete
        token = @workspaceCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        policies = payload['policies']

        expect(policies.size).to eq(4)
        self.check_policy('DELETE', 'https://taskrouter.twilio.com/v1/Workspaces/WS456', policies[3])
      end

      it 'allow fetch subresources' do
        @workspaceCapability.allow_fetch_subresources
        token = @workspaceCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        policies = payload['policies']

        expect(policies.size).to eq(4)
        self.check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/**', policies[3])
      end

      it 'allow update subresources' do
        @workspaceCapability.allow_updates_subresources
        token = @workspaceCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        policies = payload['policies']

        expect(policies.size).to eq(4)
        self.check_policy('POST', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/**', policies[3])
      end

      it 'allow delete subresources' do
        @workspaceCapability.allow_delete_subresources
        token = @workspaceCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        policies = payload['policies']

        expect(policies.size).to eq(4)
        self.check_policy('DELETE', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/**', policies[3])
      end
    end

    describe 'allow policies from constructor' do
      it 'optionals for policy' do
        @workspaceCapability = Twilio::JWT::TaskQueueCapability.new 'AC123', 'secret', 'WS456', 'WQ123', allow_delete: true
        token = @workspaceCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        policies = payload['policies']

        expect(policies.size).to eq(4)
        self.check_policy('DELETE', 'https://taskrouter.twilio.com/v1/Workspaces/WS456/TaskQueues/WQ123', policies[3])
      end
    end
  end
end

