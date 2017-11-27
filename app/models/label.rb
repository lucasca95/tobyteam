class Label < ApplicationRecord
	has_and_belongs_to_many :questions

	#Validaciones
		validates :title,
			presence: true
		validates :title,
			uniqueness: true

	default_scope ->{order("title")}

end
