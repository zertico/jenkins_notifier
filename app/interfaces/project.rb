class Project < ActiveRecord::Base
  attr_accessible :bitbucket, :endpoint, :name, :token

  validates :bitbucket, :presence => true
  validates :endpoint, :presence => true
  validates :name, :presence => true
  validates :token, :presence => true

  def working_dir
    @working_dir ||= WorkingDir.new(self)
  end

  def remote
    @remote ||= Remote.new(self)
  end
end