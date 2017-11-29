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
  #Scope busqueda
 
  def self.search (text)
    if !text.nil?
      text = text.upcase.gsub!(' ','%')
      return Question.where("REPLACE(UPPER(body),CHR(13),' ') LIKE ? or REPLACE(UPPER(title),CHR(13),' ') like ?" , "%#{text}%","%#{text}%")
    else
      return Question.all
    end
  end

  def set_best(answer)

	    answer = Answer.find(params[:answer])
	    if answer.question.id == self.id
	      self.answer = answer
	      self.save  
	    end

  end

  def voted(user)
  	return (self.votes.where(user: user).first != nil)
  end
  def vote(like, current_user)
   	positive = Action.where(:name => "Votar Pregunta Positivo").first.points
   	negative =Action.where(:name => "Votar Pregunta Negativo").first.points
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
