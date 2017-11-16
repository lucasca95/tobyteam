class Answer < ApplicationRecord
	belongs_to :user
	has_many :votes, :as => :votable
	has_many :reports, :as => :reportable
	has_many :comments, :as => :commentable

	belongs_to :question

	#Validaciones
		validates :body,
			presence: true
		validates :user_id,
			presence: true
		validates :question_id,
			presence: true
end
