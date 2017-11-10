class CreateActionsLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :actions_levels, :id => false do |t|
    	t.references :action
    	t.references :level
    end
  end
end
