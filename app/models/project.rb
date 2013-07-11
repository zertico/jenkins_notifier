class Project < ActiveRecord::Base
  attr_accessible :endpoint, :name, :token
end