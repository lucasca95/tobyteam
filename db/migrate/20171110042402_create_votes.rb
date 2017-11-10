class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.boolean :like
      t.integer :user_id
      t.references :votable, :polimorphic => true

      t.timestamps
    end
  end
end
