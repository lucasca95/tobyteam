class Question < ApplicationRecord
	#Relaciones y Dependencias
	belongs_to :user
	has_many :votes, :as => :votable, dependent: :destroy
	has_many :reports, :as => :reportable, dependent: :destroy
	has_many :comments, :as => :commentable, dependent: :destroy
	has_many :answers, dependent: :destroy
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
  scope :visited, -> {order(visits: :desc)}
  def self.unanswer
    select('questions.*, COUNT(answers.id) AS answers_count').
      joins("FULL OUTER  JOIN \"answers\" ON \"answers\".\"question_id\" = \"questions\".\"id\"").                                                   
      group('questions.id').
      order('answers_count').limit(15)
  end
  def self.populars
    select('questions.*,  (questions.visits + 10 * COUNT(answers.id) + 2 * COUNT(comments.id)) AS answers_count').
      joins("FULL OUTER  JOIN \"answers\" ON \"answers\".\"question_id\" = \"questions\".\"id\"").                                                   
      joins("FULL OUTER  JOIN \"comments\" ON \"comments\".\"commentable_id\" = \"questions\".\"id\" and \"comments\".\"commentable_type\" = 'Question'").                                                   
      where("questions.id is not null").
      group('questions.id').
      order('answers_count desc').limit(15)
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

  def set_best(answer, current_user)
      points = Action.where(:name => "Mejor Respuesta").first.points
	    if answer.question.id == self.id
        if self.answer.nil?
          self.answer = answer
          if current_user.id != answer.user.id
            answer.user.add_points(points)
  	      end
        else
          if self.answer.user.id != self.user.id
            self.answer.user.sub_points(points)
          end
          self.answer = answer
          if current_user.id != answer.user.id
            answer.user.add_points(points)
          end
        end
        self.save  
	    end

  end
  def add_visit(current_user)
    if !current_user.nil? && (current_user.id != self.user.id)
      self.visits = self.visits + 1
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
