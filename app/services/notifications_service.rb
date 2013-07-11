module NotificationsService
  include Zertico::Service

  def generate(id)
    @project = Project.find(id)
    ProjectWorker.perform_async(@project.id)
    { :project => @project }
  end

  protected

  def interface_name
    'project_id'
  end
end