class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :reason
      t.integer :user_id
      t.references :reportable, :polimorphic => true

      t.timestamps
    end
  end
end
