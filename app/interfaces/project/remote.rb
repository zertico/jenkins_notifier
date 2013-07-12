class Project
  class Remote
    def initialize(project)
      @project = project
    end

    def uri
      "git@bitbucket.org:#{@project.bitbucket}.git"
    end
  end
end