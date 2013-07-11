class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :endpoint
      t.string :token

      t.timestamps
    end
  end
end
