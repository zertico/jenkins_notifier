class Project
  class WorkingDir
    def initialize(project)
      @project = project
    end

    def path
      "#{Rails.root}/vendor/#{@project.bitbucket}"
    end
  end
end