class Label < ApplicationRecord
	has_and_belongs_to_many :questions

	#Validaciones
		validates :title,
			presence: true
		validates :active,
			presence: true
end
