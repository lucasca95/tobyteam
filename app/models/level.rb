class Level < ApplicationRecord
	has_many :user
	has_and_belongs_to_many :actions

	#Validaciones
	validates :body,
		presence: true
	validates :body,
		numericality: true
	validates :body,
		uniqueness: true

end
