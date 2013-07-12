module ProjectsService
  include Zertico::Service

  def generate(attributes = {})
    @project = Project.create(attributes)
    ProjectInitializerWorker.perform_async(@project.id) if @project.persisted?
    { :project => @project }
  end

  def delete(id)
    @project = Project.find(id)
    @project.destroy
    ProjectDestroyerWorker.perform_async(@project.id) if @project.frozen?
    { :project => @project }
  end
end