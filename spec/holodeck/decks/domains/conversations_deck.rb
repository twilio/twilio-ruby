class ConversationsHolodeckResource < HolodeckResource
  @sub_resources = {
      conversations: ConversationInstanceHolodeckResource,
  }
  @holograms = []
end