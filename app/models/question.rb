class Question < ApplicationRecord
	#Relaciones y Dependencias
	belongs_to :user
	has_many :votes, :as => :votable
	has_many :reports, :as => :reportable
	has_many :comments, :as => :commentable
	has_many :answers
	belongs_to :answer , optional: true
	has_and_belongs_to_many :labels
	#Validaciones
	validates :title,
		presence: true
	validates :body,
		presence: true
	#SCOPES
	default_scope -> { order("created_at desc") }
end
