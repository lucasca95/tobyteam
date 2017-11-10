class AddColumnsUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :name, :string
  	add_column :users, :lastname, :string
  	add_column :users, :university_id, :integer
  	add_column :users, :level_id, :integer
  	add_column :users, :points, :integer
  end
end
