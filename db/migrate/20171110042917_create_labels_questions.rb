class CreateLabelsQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :labels_questions, :id => false do |t|
    	t.references :label
    	t.references :question
    end
  end
end
