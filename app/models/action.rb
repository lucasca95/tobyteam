class Action < ApplicationRecord
	has_and_belongs_to_many :levels


	scope :alfabeta, -> {order("name")}
end
