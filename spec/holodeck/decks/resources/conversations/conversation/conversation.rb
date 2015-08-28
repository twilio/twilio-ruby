class ConversationsHolodeckResource < HolodeckResource
  require './spec/holodeck/decks/resources/conversations/conversation/participant/participant.rb'

  require './spec/holodeck/decks/resources/conversations/conversation/in_progress/in_progress.rb'

  require './spec/holodeck/decks/resources/conversations/conversation/completed/completed.rb'

  class ConversationInstanceHolodeckResource < HolodeckResource
    @sub_resources = {
        participants: ConversationsHolodeckResource::ParticipantInstanceHolodeckResource,
        in_progress: ConversationsHolodeckResource::InProgressInstanceHolodeckResource,
        completed: ConversationsHolodeckResource::CompletedInstanceHolodeckResource,
    }
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "conversation_fetch_200.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "conversation_update_200.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 204,
            content_file: File.join(File.dirname(__FILE__), "conversation_delete_204.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://conversations.twilio.com/v1/Conversations/CVllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "conversation_delete_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://conversations.twilio.com/v1/Conversations/CVllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "conversation_fetch_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://conversations.twilio.com/v1/Conversations/CVllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "conversation_update_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://conversations.twilio.com/v1/Conversations/CVkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "conversation_delete_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://conversations.twilio.com/v1/Conversations/CVkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "conversation_fetch_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://conversations.twilio.com/v1/Conversations/CVkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "conversation_update_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://conversations.twilio.com/v1/Conversations/CVmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "conversation_delete_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://conversations.twilio.com/v1/Conversations/CVmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "conversation_fetch_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://conversations.twilio.com/v1/Conversations/CVmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "conversation_update_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end

class ConversationsHolodeckResource < HolodeckResource
  require './spec/holodeck/decks/resources/conversations/conversation/participant/participant.rb'

  require './spec/holodeck/decks/resources/conversations/conversation/in_progress/in_progress.rb'

  require './spec/holodeck/decks/resources/conversations/conversation/completed/completed.rb'

  class ConversationInstanceHolodeckResource < HolodeckResource
    @sub_resources = {
        participants: ConversationsHolodeckResource::ParticipantInstanceHolodeckResource,
        in_progress: ConversationsHolodeckResource::InProgressInstanceHolodeckResource,
        completed: ConversationsHolodeckResource::CompletedInstanceHolodeckResource,
    }
    @holograms = [
        Hologram.new(
            method: "GET",
            url: "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "conversation_fetch_200.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 200,
            content_file: File.join(File.dirname(__FILE__), "conversation_update_200.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://conversations.twilio.com/v1/Conversations/CVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
            auth: ["ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "AUTHTOKEN"],
            status_code: 204,
            content_file: File.join(File.dirname(__FILE__), "conversation_delete_204.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://conversations.twilio.com/v1/Conversations/CVllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "conversation_delete_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://conversations.twilio.com/v1/Conversations/CVllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "conversation_fetch_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://conversations.twilio.com/v1/Conversations/CVllllllllllllllllllllllllllllllll.json",
            auth: ["ACllllllllllllllllllllllllllllllll", "AUTHTOKEN"],
            status_code: 401,
            content_file: File.join(File.dirname(__FILE__), "conversation_update_401.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://conversations.twilio.com/v1/Conversations/CVkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "conversation_delete_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://conversations.twilio.com/v1/Conversations/CVkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "conversation_fetch_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://conversations.twilio.com/v1/Conversations/CVkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.json",
            auth: ["ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk", "AUTHTOKEN"],
            status_code: 404,
            content_file: File.join(File.dirname(__FILE__), "conversation_update_404.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "DELETE",
            url: "https://conversations.twilio.com/v1/Conversations/CVmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "conversation_delete_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "GET",
            url: "https://conversations.twilio.com/v1/Conversations/CVmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "conversation_fetch_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
        Hologram.new(
            method: "POST",
            url: "https://conversations.twilio.com/v1/Conversations/CVmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm.json",
            auth: ["ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm", "AUTHTOKEN"],
            status_code: 500,
            content_file: File.join(File.dirname(__FILE__), "conversation_update_500.json"),
            query_params: '{}',
            form_params: '{}',
            headers: HolodeckResource::DEFAULT_HEADERS
        ),
    ]
  end
end