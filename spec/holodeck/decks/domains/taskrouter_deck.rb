class TaskrouterHolodeckResource < HolodeckResource
  @sub_resources = {
      workspaces: WorkspaceInstanceHolodeckResource,
  }
  @holograms = []
end