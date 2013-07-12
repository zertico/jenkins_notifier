class ProjectInitializerWorker
  include Sidekiq::Worker

  def perform(id)
    @project = Project.find(id)
    Dir.mkdir(@project.working_dir.path, 0700) unless File.directory?(@project.working_dir.path)
    Git.clone(@project.remote.uri, @project.name, :path => @project.working_dir.path)
  end
end