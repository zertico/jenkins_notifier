require 'uri'

class Project
  class Build
    def initialize(project)
      @project = project
    end

    def uri
      URI.parse("#{@project.endpoint}/#{@project.name}/build")
    end
  end
end