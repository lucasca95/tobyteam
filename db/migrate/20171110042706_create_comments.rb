class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id
      t.references :commentable, :polimorphic => true

      t.timestamps
    end
  end
end
