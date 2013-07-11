class AddBitbucketToProject < ActiveRecord::Migration
  def change
    add_column :projects, :bitbucket, :string
  end
end