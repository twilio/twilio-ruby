class TaskrouterHolodeckResource < HolodeckResource
  @sub_resources = {
      workspaces: TaskrouterHolodeckResource::WorkspaceInstanceHolodeckResource,
  }
  @holograms = []
end