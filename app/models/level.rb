class Level < ApplicationRecord
	has_many :user
	has_and_belongs_to_many :actions
end
