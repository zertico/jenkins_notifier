class Project < ActiveRecord::Base
  attr_accessible :bitbucket, :endpoint, :name, :token

  validates :bitbucket, :presence => true
  validates :endpoint, :presence => true
  validates :name, :presence => true
  validates :token, :presence => true
end