class ProjectDestroyerWorker
  include Sidekiq::Worker

  def perform(id)
    @project = Project.find(id)
    FileUtils.rmtree(@project.working_dir.path) if File.directory?(@project.working_dir.path)
  end
end