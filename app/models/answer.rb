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

	def voted(user)
  		return (self.votes.where(user: user).first != nil)
  	end
  	def vote(like, current_user)
	   	positive = Action.where(:name => "Votar Respuesta Positivo").first.points
	   	negative =Action.where(:name => "Votar Respuesta Negativo").first.points
	  	  if self.voted(current_user)
	  	  	if !(self.votes.where(user: current_user).first.update(:like => like))
	  	  		return false
	  	  	end
	  	  	if like
	  	   		self.user.add_points(negative)
	  	   		self.user.add_points(positive)
	  	   		current_user.add_points(positive)
	  	   	else
	  	   		self.user.add_points(-positive)
				self.user.add_points(-negative)
				current_user.add_points(-negative)
	  	    end
	  	  	#Cambiar Voto
	  	  else
	  	  	if !(Vote.create(:votable => self,:like => like,:user => current_user))
	  	  		return false
	  	  	end
	  	    if like
	  	   		self.user.add_points(positive)
	  	   	else
				self.user.add_points(-negative)
				current_user.add_points(-negative)
	  	    end
	  	  	#Cambiar Punto
	  	  end
	  	  return true
  	end
end
