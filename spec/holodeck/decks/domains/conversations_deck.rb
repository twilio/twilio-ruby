class ConversationsHolodeckResource < HolodeckResource
  @sub_resources = {
      conversations: ConversationsHolodeckResource::ConversationInstanceHolodeckResource,
  }
  @holograms = []
end