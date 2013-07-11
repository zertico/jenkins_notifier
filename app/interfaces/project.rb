class Project < ActiveRecord::Base
  attr_accessible :bitbucket, :endpoint, :name, :token
end