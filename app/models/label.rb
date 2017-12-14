class Label < ApplicationRecord
	has_and_belongs_to_many :questions

	#Validaciones
		validates :title,
			presence: true
		validates :title,
			uniqueness: true

	scope :title, ->{order("title")}
  def self.used
    select('labels.*, COUNT(questions.id) AS questions_count').
      joins(:labels_questions).joins(:questions).                                                 
      group('labels.id').
      order('questions_count desc').limit(15)
  end
end
