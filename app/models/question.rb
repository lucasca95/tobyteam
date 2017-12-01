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
	#Dejamos de usar el por defecto porque trae problemas con el orden
  #default_scope -> { order("created_at desc") }
  #Scope busqueda

  scope :created, -> {order(created_at: :desc)}
   
  def self.unanswer
    select('questions.*, COUNT(answers.id) AS answers_count').
      joins("FULL OUTER  JOIN \"answers\" ON \"answers\".\"question_id\" = \"questions\".\"id\"").                                                   
      group('questions.id').
      order('answers_count').limit(15)
  end

############
  def self.search (text)
    if !text.nil?
      text = text.upcase.gsub(' ','%')
      q = Question.where("REPLACE(UPPER(body),CHR(13),' ') LIKE ? or REPLACE(UPPER(title),CHR(13),' ') like ?" , "%#{text}%","%#{text}%")
      return q
    else
      return Question.all
    end
  end

  def set_best(answer)
      points = Action.where(:name => "Mejor Respuesta").first.points
	    if answer.question.id == self.id
	      self.answer = answer
        answer.user.add_points(points)
	      self.save  
	    end

  end

  def voted(user)
  	return (self.votes.where(user: user).first != nil)
  end
  def vote(like, current_user)
   	positive = Action.where(:name => "Votar Pregunta Positivo").first.points
   	negative =Action.where(:name => "Votar Pregunta Negativo").first.points
    negative_action = Action.where(:name => "Accion Negativa").first.points
  	  if self.voted(current_user)
  	  	if !(self.votes.where(user: current_user).first.update(:like => like))
  	  		return false
  	  	end
  	  	if like == "true"
  	   		self.user.add_points(negative)
  	   		self.user.add_points(positive)
  	   		current_user.add_points(negative_action)
  	   	else
  	   		self.user.sub_points(positive)
			    self.user.sub_points(negative)
			    current_user.sub_points(negative_action)
  	    end
  	  	#Cambiar Voto
  	  else
  	  	if !(Vote.create(:votable => self,:like => like,:user => current_user))
  	  		return false
  	  	end
  	    if like == "true"
  	   		self.user.add_points(positive)
  	   	else
			   self.user.sub_points(negative)
			   current_user.sub_points(negative_action)
  	    end
  	  	#Cambiar Punto
  	  end
  	  return true
  end
end
