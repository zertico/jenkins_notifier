class ProjectInitializerWorker
  include Sidekiq::Worker

  def perform(id)
    @project = Project.find(id)
    FileUtils.mkdir_p(@project.working_dir.path) unless File.directory?(@project.working_dir.path)
    Git.clone(@project.remote.uri, '', :path => @project.working_dir.path)
  end
end