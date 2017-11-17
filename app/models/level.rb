class Level < ApplicationRecord
	has_many :user
	has_and_belongs_to_many :actions

	#Validaciones
	validates :points,
		presence: true
	validates :points,
		numericality: true
	validates :points,
		uniqueness: true

	validates :name,
		presence: true
	validates :name,
		uniqueness: true

end
