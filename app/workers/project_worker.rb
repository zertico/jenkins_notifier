require 'net/http'

class ProjectWorker
  include Sidekiq::Worker

  def perform(id)
    @project = Project.find(id)
    g = Git.open(@project.working_dir.path)

    g.fetch

    branchs_to_build = []

    g.branches.remote.each do |remote|
      unless remote.to_s.match(/HEAD/)
        local = remote.to_s.gsub('remotes/origin/', '')
        if g.is_branch?(local)
          unless g.diff(local, remote).size == 0
            branchs_to_build << local
            g.branch(local).merge(remote)
          end
        else
          g.checkout(local)
          branchs_to_build << local
        end
      end
    end

    branchs_to_build.each do |branch|
      http = Net::HTTP.new(@project.build.uri.host, @project.build.uri.port)
      request = Net::HTTP::Post.new("#{@project.build.uri.request_uri}?branch=#{branch}")
      request.content_type = 'application/json'
      http.request(request)
    end
  end
end