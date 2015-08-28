class V2010HolodeckResource < HolodeckResource
  require './spec/holodeck/decks/resources/v2010/account/address/address.rb'

  require './spec/holodeck/decks/resources/v2010/account/application/application.rb'

  require './spec/holodeck/decks/resources/v2010/account/authorized_connect_app/authorized_connect_app.rb'

  require './spec/holodeck/decks/resources/v2010/account/available_phone_number/available_phone_number.rb'

  require './spec/holodeck/decks/resources/v2010/account/call/call.rb'

  require './spec/holodeck/decks/resources/v2010/account/conference/conference.rb'

  require './spec/holodeck/decks/resources/v2010/account/connect_app/connect_app.rb'

  require './spec/holodeck/decks/resources/v2010/account/incoming_phone_number/incoming_phone_number.rb'

  require './spec/holodeck/decks/resources/v2010/account/message/message.rb'

  require './spec/holodeck/decks/resources/v2010/account/notification/notification.rb'

  require './spec/holodeck/decks/resources/v2010/account/outgoing_caller_id/outgoing_caller_id.rb'

  require './spec/holodeck/decks/resources/v2010/account/queue/queue.rb'

  require './spec/holodeck/decks/resources/v2010/account/recording/recording.rb'

  require './spec/holodeck/decks/resources/v2010/account/sandbox/sandbox.rb'

  require './spec/holodeck/decks/resources/v2010/account/sip/sip.rb'

  require './spec/holodeck/decks/resources/v2010/account/sms/sms.rb'

  require './spec/holodeck/decks/resources/v2010/account/token/token.rb'

  require './spec/holodeck/decks/resources/v2010/account/transcription/transcription.rb'

  require './spec/holodeck/decks/resources/v2010/account/usage/usage.rb'

  class AccountInstanceHolodeckResource < HolodeckResource
    @sub_resources = {
        addresses: V2010HolodeckResource::AddressInstanceHolodeckResource,
        applications: V2010HolodeckResource::ApplicationInstanceHolodeckResource,
        authorized_connect_apps: V2010HolodeckResource::AuthorizedConnectAppInstanceHolodeckResource,
        available_phone_numbers: V2010HolodeckResource::AvailablePhoneNumberCountryInstanceHolodeckResource,
        calls: V2010HolodeckResource::CallInstanceHolodeckResource,
        conferences: V2010HolodeckResource::ConferenceInstanceHolodeckResource,
        connect_apps: V2010HolodeckResource::ConnectAppInstanceHolodeckResource,
        incoming_phone_numbers: V2010HolodeckResource::IncomingPhoneNumberInstanceHolodeckResource,
        messages: V2010HolodeckResource::MessageInstanceHolodeckResource,
        notifications: V2010HolodeckResource::NotificationInstanceHolodeckResource,
        outgoing_caller_ids: V2010HolodeckResource::OutgoingCallerIdInstanceHolodeckResource,
        queues: V2010HolodeckResource::QueueInstanceHolodeckResource,
        recordings: V2010HolodeckResource::RecordingInstanceHolodeckResource,
        sandbox: V2010HolodeckResource::SandboxInstanceHolodeckResource,
        sip: V2010HolodeckResource::SipInstanceHolodeckResource,
        sms: V2010HolodeckResource::SmsInstanceHolodeckResource,
        tokens: V2010HolodeckResource::TokenInstanceHolodeckResource,
        transcriptions: V2010HolodeckResource::TranscriptionInstanceHolodeckResource,
        usage: V2010HolodeckResource::UsageInstanceHolodeckResource,
    }
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "account_read_200_empty.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "account_read_200_partial.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "account_fetch_200.json"),
            query_params: '{"Sid": "sid"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "account_create_200.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "account_update_200.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name", "Status": "status"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 204,
            content_file: File.join(File.dirname(__FILE__), "account_delete_204.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "account_delete_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "account_read_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "account_fetch_401.json"),
            query_params: '{"Sid": "sid"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "account_create_401.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "account_update_401.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name", "Status": "status"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "account_delete_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "account_read_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "account_fetch_404.json"),
            query_params: '{"Sid": "sid"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "account_create_404.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "account_update_404.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name", "Status": "status"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "account_delete_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "account_read_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "account_fetch_500.json"),
            query_params: '{"Sid": "sid"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "account_create_500.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "account_update_500.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name", "Status": "status"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end

class V2010HolodeckResource < HolodeckResource
  require './spec/holodeck/decks/resources/v2010/account/address/address.rb'

  require './spec/holodeck/decks/resources/v2010/account/application/application.rb'

  require './spec/holodeck/decks/resources/v2010/account/authorized_connect_app/authorized_connect_app.rb'

  require './spec/holodeck/decks/resources/v2010/account/available_phone_number/available_phone_number.rb'

  require './spec/holodeck/decks/resources/v2010/account/call/call.rb'

  require './spec/holodeck/decks/resources/v2010/account/conference/conference.rb'

  require './spec/holodeck/decks/resources/v2010/account/connect_app/connect_app.rb'

  require './spec/holodeck/decks/resources/v2010/account/incoming_phone_number/incoming_phone_number.rb'

  require './spec/holodeck/decks/resources/v2010/account/message/message.rb'

  require './spec/holodeck/decks/resources/v2010/account/notification/notification.rb'

  require './spec/holodeck/decks/resources/v2010/account/outgoing_caller_id/outgoing_caller_id.rb'

  require './spec/holodeck/decks/resources/v2010/account/queue/queue.rb'

  require './spec/holodeck/decks/resources/v2010/account/recording/recording.rb'

  require './spec/holodeck/decks/resources/v2010/account/sandbox/sandbox.rb'

  require './spec/holodeck/decks/resources/v2010/account/sip/sip.rb'

  require './spec/holodeck/decks/resources/v2010/account/sms/sms.rb'

  require './spec/holodeck/decks/resources/v2010/account/token/token.rb'

  require './spec/holodeck/decks/resources/v2010/account/transcription/transcription.rb'

  require './spec/holodeck/decks/resources/v2010/account/usage/usage.rb'

  class AccountInstanceHolodeckResource < HolodeckResource
    @sub_resources = {
        addresses: V2010HolodeckResource::AddressInstanceHolodeckResource,
        applications: V2010HolodeckResource::ApplicationInstanceHolodeckResource,
        authorized_connect_apps: V2010HolodeckResource::AuthorizedConnectAppInstanceHolodeckResource,
        available_phone_numbers: V2010HolodeckResource::AvailablePhoneNumberCountryInstanceHolodeckResource,
        calls: V2010HolodeckResource::CallInstanceHolodeckResource,
        conferences: V2010HolodeckResource::ConferenceInstanceHolodeckResource,
        connect_apps: V2010HolodeckResource::ConnectAppInstanceHolodeckResource,
        incoming_phone_numbers: V2010HolodeckResource::IncomingPhoneNumberInstanceHolodeckResource,
        messages: V2010HolodeckResource::MessageInstanceHolodeckResource,
        notifications: V2010HolodeckResource::NotificationInstanceHolodeckResource,
        outgoing_caller_ids: V2010HolodeckResource::OutgoingCallerIdInstanceHolodeckResource,
        queues: V2010HolodeckResource::QueueInstanceHolodeckResource,
        recordings: V2010HolodeckResource::RecordingInstanceHolodeckResource,
        sandbox: V2010HolodeckResource::SandboxInstanceHolodeckResource,
        sip: V2010HolodeckResource::SipInstanceHolodeckResource,
        sms: V2010HolodeckResource::SmsInstanceHolodeckResource,
        tokens: V2010HolodeckResource::TokenInstanceHolodeckResource,
        transcriptions: V2010HolodeckResource::TranscriptionInstanceHolodeckResource,
        usage: V2010HolodeckResource::UsageInstanceHolodeckResource,
    }
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "account_read_200_empty.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "account_read_200_partial.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "account_fetch_200.json"),
            query_params: '{"Sid": "sid"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "account_create_200.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "account_update_200.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name", "Status": "status"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 204,
            content_file: File.join(File.dirname(__FILE__), "account_delete_204.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "account_delete_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "account_read_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "account_fetch_401.json"),
            query_params: '{"Sid": "sid"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "account_create_401.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "account_update_401.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name", "Status": "status"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "account_delete_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "account_read_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "account_fetch_404.json"),
            query_params: '{"Sid": "sid"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "account_create_404.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "account_update_404.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name", "Status": "status"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "account_delete_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "account_read_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "account_fetch_500.json"),
            query_params: '{"Sid": "sid"}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "account_create_500.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://api.twilio.com/2010-04-01/Accounts/ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "account_update_500.json"),
            query_params: '{}',
            form_params: '{"FriendlyName": "friendly_name", "Status": "status"}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end