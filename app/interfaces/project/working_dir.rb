class Project
  class WorkingDir
    def initialize(project)
      @project = project
    end

    def path
      "#{Rails.root}/vendor/projects/#{@project.bitbucket}"
    end
  end
end