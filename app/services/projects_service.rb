module ProjectsService
  include Zertico::Service

  def generate(attributes = {})
    @project = Project.create(attributes)
    ProjectInitializerWorker.perform_async(@project.id) if @project.persisted?
    { :project => @project }
  end
end