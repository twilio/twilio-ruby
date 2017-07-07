require 'spec_helper'

describe 'TaskRouter ' do
  def check_policy(method, url, policy, post_filter: {}, query_filter: {}, allow: true)
    expect(policy['url']).to eq(url)
    expect(policy['method']).to eq(method)
    expect(policy['post_filter']).to eq(post_filter)
    expect(policy['query_filter']).to eq(query_filter)
    expect(policy['allow']).to eq(allow)
  end

  describe Twilio::JWT::TaskRouterCapability do
    describe 'token initialization' do
      before :each do
        @taskRouterCapability = Twilio::JWT::TaskRouterCapability.new 'AC123', 'secret', 'WS456', 'CI123'
      end

      it 'generate default' do
        token = @taskRouterCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        expect(payload['iss']).to eq('AC123')
        expect(payload['workspace_sid']).to eq('WS456')
        expect(payload['policies']).not_to be_nil
        expect(payload['policies'].size).to eq(2)
      end

      it 'add policy' do
        @policy = Twilio::JWT::TaskRouterCapability::Policy.new(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.workspace('WK123'), 'GET', true)
        @taskRouterCapability.add_policy(@policy)
        token = @taskRouterCapability.to_s
        payload, _ = JWT.decode token, 'secret'
        expect(payload['policies']).not_to be_nil
        expect(payload['policies'].size).to eq(3)
        check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WK123', payload['policies'][0])
        check_policy('GET', 'https://event-bridge.twilio.com/v1/wschannels/AC123/CI123', payload['policies'][1])
        check_policy('POST', 'https://event-bridge.twilio.com/v1/wschannels/AC123/CI123', payload['policies'][2])
      end
    end
  end

  describe Twilio::JWT::TaskRouterCapability::Policy do
    describe 'policy' do
      it 'initialize' do
        @policy = Twilio::JWT::TaskRouterCapability::Policy.new('test-url',
                                                                'GET',
                                                                true,
                                                                { 'test-post-key' => 'test-post-value' },
                                                                'test-query-key' => 'test-query-value')

        payload = Hash[@policy._generate_payload.map { |k, v| [k.to_s, v] }]
        check_policy('GET',
                     'test-url',
                     payload,
                     post_filter: { 'test-post-key' => 'test-post-value' },
                     query_filter: { 'test-query-key' => 'test-query-value' },
                     allow: true)
      end
    end

    describe Twilio::JWT::TaskRouterCapability::TaskRouterUtils do
      describe 'urls' do
        it 'workspaces' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.workspaces).to eq(expected_url)
        end

        it 'workspace' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.workspace('WK123')).to eq(expected_url)
        end

        it 'all_workspaces' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/**'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.all_workspaces).to eq(expected_url)
        end

        it 'tasks' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Tasks'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.tasks('WK123')).to eq(expected_url)
        end

        it 'task' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Tasks/TK123'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.task('WK123', 'TK123')).to eq(expected_url)
        end

        it 'all_tasks' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Tasks/**'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.all_tasks('WK123')).to eq(expected_url)
        end

        it 'task_queues' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/TaskQueues'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.task_queues('WK123')).to eq(expected_url)
        end

        it 'task_queue' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/TaskQueues/WQ123'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.task_queue('WK123', 'WQ123')).to eq(expected_url)
        end

        it 'all_task_queues' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/TaskQueues/**'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.all_task_queues('WK123')).to eq(expected_url)
        end

        it 'activities' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/AT123/Activities'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.activities('AT123')).to eq(expected_url)
        end

        it 'activity' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Activities/AT123'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.activity('WK123', 'AT123')).to eq(expected_url)
        end

        it 'all_activities' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Activities/**'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.all_activities('WK123')).to eq(expected_url)
        end

        it 'workers' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Workers'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.workers('WK123')).to eq(expected_url)
        end

        it 'worker' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Workers/WT123'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.worker('WK123', 'WT123')).to eq(expected_url)
        end

        it 'all_workers' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Workers/**'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.all_workers('WK123')).to eq(expected_url)
        end

        it 'reservations' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Workers/WT123/Reservations'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.reservations('WK123', 'WT123')).to eq(expected_url)
        end

        it 'reservation' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Workers/WT123/Reservations/RS123'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.reservation('WK123', 'WT123', 'RS123')).to eq(expected_url)
        end

        it 'all_reservations' do
          expected_url = 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Workers/WT123/Reservations/**'
          expect(Twilio::JWT::TaskRouterCapability::TaskRouterUtils.all_reservations('WK123', 'WT123')).to eq(expected_url)
        end
      end

      describe 'default policies' do
        it 'default web_socket_policies' do
          @policies = Twilio::JWT::TaskRouterCapability::TaskRouterUtils.web_socket_policies('AC123', 'CI123')
          get, post = @policies.map(&:_generate_payload)
          check_policy('GET', 'https://event-bridge.twilio.com/v1/wschannels/AC123/CI123', Hash[get.map { |k, v| [k.to_s, v] }])
          check_policy('POST', 'https://event-bridge.twilio.com/v1/wschannels/AC123/CI123', Hash[post.map { |k, v| [k.to_s, v] }])
        end

        it 'default worker policies' do
          @policies = Twilio::JWT::TaskRouterCapability::TaskRouterUtils.worker_policies('WK123', 'WT123')
          payload = @policies.map(&:_generate_payload)
          check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Activities', Hash[payload[0].map { |k, v| [k.to_s, v] }])
          check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Tasks/**', Hash[payload[1].map { |k, v| [k.to_s, v] }])
          check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Workers/WT123/Reservations/**', Hash[payload[2].map { |k, v| [k.to_s, v] }])
          check_policy('GET', 'https://taskrouter.twilio.com/v1/Workspaces/WK123/Workers/WT123', Hash[payload[3].map { |k, v| [k.to_s, v] }])
        end
      end
    end
  end
end
