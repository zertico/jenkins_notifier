module JobsService
  include Zertico::Service

  def generate(id)
    @project = Project.find(id)
    ProjectWorker.perform_async(@project.id)
    { :project => @project, :location => Rails.application.routes.url_helpers.projects_path }
  end

  protected

  def interface_name
    'project_id'
  end
end