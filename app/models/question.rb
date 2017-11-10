class Question < ApplicationRecord
	belongs_to :user
	has_many :votes, :as => :votable
	has_many :reports, :as => :repotable
	has_many :comments, :as => :commentable
	has_many :answers
	has_and_belongs_to_many :labels
end