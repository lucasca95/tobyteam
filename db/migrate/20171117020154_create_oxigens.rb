class CreateOxigens < ActiveRecord::Migration[5.1]
  def change
    create_table :oxigens do |t|

      t.timestamps
    end
  end
end
