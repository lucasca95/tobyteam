class Answer < ApplicationRecord
	belongs_to :user
	has_many :votes, :as => :votable
	has_many :reports, :as => :repotable
	has_many :comments, :as => :commentable

	belongs_to :question

end
