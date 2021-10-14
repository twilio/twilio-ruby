require 'spec_helper'

describe Twilio::JWT::AccessToken do
  describe 'access_token functionality ' do
    it 'should generate a token for no grants' do
      scat = Twilio::JWT::AccessToken.new 'AC123', 'SK123', 'secret'
      payload, _ = JWT.decode scat.to_s, 'secret'
      expect(payload['sub']).to eq('AC123')
      expect(payload['iss']).to eq('SK123')
      expect(payload['exp']).to be > Time.now.to_i
      expect(payload['jti']).to start_with payload['iss']
      expect(payload['nbf']).to be <= Time.now.to_i
      expect(payload['grants']).not_to be_nil
      expect(payload['grants'].count).to eq(0)
    end

    it 'should add the proper headers without region' do
      scat = Twilio::JWT::AccessToken.new 'AC123', 'SK123', 'secret'
      _, headers = JWT.decode scat.to_s, 'secret'
      expect(headers['cty']).to eq('twilio-fpa;v=1')
      expect(headers['twr']).to be_nil
    end

    it 'should add the proper headers with region' do
      scat = Twilio::JWT::AccessToken.new 'AC123', 'SK123', 'secret', region: 'foo'
      _, headers = JWT.decode scat.to_s, 'secret'
      expect(headers['cty']).to eq('twilio-fpa;v=1')
      expect(headers['twr']).to eq('foo')
    end

    it 'identity should exist in the grants' do
      scat = Twilio::JWT::AccessToken.new 'AC123', 'SK123', 'secret', identity: 'test-identity'
      payload, _ = JWT.decode scat.to_s, 'secret'
      expect(payload['grants']).to eq({'identity' => 'test-identity'})
    end

    it 'grants during initialization' do
      room_grant = Twilio::JWT::AccessToken::VideoGrant.new
      room_grant.room = 'RM123'
      grants = [room_grant]
      scat = Twilio::JWT::AccessToken.new 'AC123', 'SK123', 'secret', grants
      payload, _ = JWT.decode scat.to_s, 'secret'
      expect(payload['grants'].count).to eq(1)
      expect(payload['grants']['video']['room']).to eq('RM123')
    end

    describe 'all the grants' do
      before :each do
        @scat = Twilio::JWT::AccessToken.new 'AC123', 'SK123', 'secret'
      end

      it 'IpMessaging grant' do
        Gem::Deprecate.skip_during do
          ip_messaging_grant = Twilio::JWT::AccessToken::IpMessagingGrant.new
          ip_messaging_grant.service_sid = 'SS123'
          ip_messaging_grant.endpoint_id = 'EP123'
          ip_messaging_grant.deployment_role_sid = 'DR123'
          ip_messaging_grant.push_credential_sid = 'PC123'
          @scat.add_grant(ip_messaging_grant)
          payload, _ = JWT.decode @scat.to_s, 'secret'
          expect(payload['grants'].count).to eq(1)
          expect(payload['grants']['ip_messaging']['service_sid']).to eq('SS123')
          expect(payload['grants']['ip_messaging']['endpoint_id']).to eq('EP123')
          expect(payload['grants']['ip_messaging']['push_credential_sid']).to eq('PC123')
          expect(payload['grants']['ip_messaging']['deployment_role_sid']).to eq('DR123')
        end
      end

      it 'Chat grant' do
        chat_grant = Twilio::JWT::AccessToken::ChatGrant.new
        chat_grant.service_sid = 'SS123'
        chat_grant.endpoint_id = 'EP123'
        chat_grant.deployment_role_sid = 'DR123'
        chat_grant.push_credential_sid = 'PC123'
        @scat.add_grant(chat_grant)
        payload, _ = JWT.decode @scat.to_s, 'secret'
        expect(payload['grants'].count).to eq(1)
        expect(payload['grants']['chat']['service_sid']).to eq('SS123')
        expect(payload['grants']['chat']['endpoint_id']).to eq('EP123')
        expect(payload['grants']['chat']['push_credential_sid']).to eq('PC123')
        expect(payload['grants']['chat']['deployment_role_sid']).to eq('DR123')
      end

      it 'Voice grant' do
        voice_grant = Twilio::JWT::AccessToken::VoiceGrant.new
        voice_grant.incoming_allow = true
        voice_grant.outgoing_application_sid = 'AP123'
        voice_grant.outgoing_application_params = {:foo => 'bar'}
        voice_grant.push_credential_sid = 'PC123'
        voice_grant.endpoint_id = 'EP123'
        @scat.add_grant(voice_grant)
        payload, _ = JWT.decode @scat.to_s, 'secret'
        expect(payload['grants'].count).to eq(1)
        expect(payload['grants']['voice']['incoming']['allow']).to eq(true)
        expect(payload['grants']['voice']['outgoing']['application_sid']).to eq('AP123')
        expect(payload['grants']['voice']['outgoing']['params']['foo']).to eq('bar')
        expect(payload['grants']['voice']['push_credential_sid']).to eq('PC123')
        expect(payload['grants']['voice']['endpoint_id']).to eq('EP123')
      end

      it 'Sync grant' do
        sync_grant = Twilio::JWT::AccessToken::SyncGrant.new
        sync_grant.service_sid = 'SS123'
        sync_grant.endpoint_id = 'EP123'
        @scat.add_grant(sync_grant)
        payload, _ = JWT.decode @scat.to_s, 'secret'
        expect(payload['grants'].count).to eq(1)
        expect(payload['grants']['data_sync']['service_sid']).to eq('SS123')
        expect(payload['grants']['data_sync']['endpoint_id']).to eq('EP123')
      end

      it 'Conversations grant' do
        Gem::Deprecate.skip_during do
          conversation_grant = Twilio::JWT::AccessToken::ConversationsGrant.new
          conversation_grant.configuration_profile_sid = 'VS123'
          @scat.add_grant(conversation_grant)
          payload, _ = JWT.decode @scat.to_s, 'secret'
          expect(payload['grants'].count).to eq(1)
          expect(payload['grants']['rtc']['configuration_profile_sid']).to eq('VS123')
        end
      end

      it 'Room grant' do
        room_grant = Twilio::JWT::AccessToken::VideoGrant.new
        room_grant.room = 'RM123'
        @scat.add_grant(room_grant)
        payload, _ = JWT.decode @scat.to_s, 'secret'
        expect(payload['grants'].count).to eq(1)
        expect(payload['grants']['video']['room']).to eq('RM123')
      end

      it 'TaskRouter grant' do
        task_router_grant = Twilio::JWT::AccessToken::TaskRouterGrant.new
        task_router_grant.workspace_sid = 'WS123'
        task_router_grant.worker_sid = 'WK123'
        task_router_grant.role = 'worker'
        @scat.add_grant(task_router_grant)
        payload, _ = JWT.decode @scat.to_s, 'secret'
        expect(payload['grants'].count).to eq(1)
        expect(payload['grants']['task_router']['workspace_sid']).to eq('WS123')
        expect(payload['grants']['task_router']['worker_sid']).to eq('WK123')
        expect(payload['grants']['task_router']['role']).to eq('worker')
      end

      it 'Playback grant' do
        playback_grant = Twilio::JWT::AccessToken::PlaybackGrant.new
        grant = {
          'requestCredentials' => nil,
          'playbackUrl' => 'https://000.us-east-1.playback.live-video.net/api/video/v1/us-east-000.channel.000?token=xxxxx',
          'playerStreamerSid' => 'VJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
        }
        playback_grant.grant = grant
        @scat.add_grant(playback_grant)
        payload, _ = JWT.decode @scat.to_s, 'secret'
        expect(payload['grants'].count).to eq(1)
        expect(payload['grants']['player']).to eq(grant)
      end

      it 'multiple grants' do
        room_grant = Twilio::JWT::AccessToken::VideoGrant.new
        room_grant.room = 'RM123'
        @scat.add_grant(room_grant)
        task_router_grant = Twilio::JWT::AccessToken::TaskRouterGrant.new
        task_router_grant.workspace_sid = 'WS123'
        @scat.add_grant(task_router_grant)
        payload, _ = JWT.decode @scat.to_s, 'secret'
        expect(payload['grants'].count).to eq(2)
        expect(payload['grants']['video']).not_to be_nil
        expect(payload['grants']['task_router']).not_to be_nil
      end
    end
  end
end
