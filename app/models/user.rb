class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notifications, dependent: :destroy
  has_many :votes
  has_many :reports
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy

  belongs_to :university, optional: true
  belongs_to :level

  #Validaciones
    #nombre
    validates :name, presence: true
    validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: ": sólo se permiten letras en el nombre" }

    #apellido
    validates :lastname, presence: true
    validates :lastname, format: { with: /\A[a-zA-Z]+\z/,
    message: ": sólo se permiten letras en el apellido" }

    #points
    validates :points, presence: true
    validates :points, numericality: true

    
    #level_id
    validates :level_id, presence: true
    validates :level_id, numericality: true
    def update_level()
      @level = Level.actualizar.where("points <= #{self.points} ").first
      if (!@level.nil?)
        if (self.level.id != @level.id)
          self.level_id = @level.id
        end
      else
        self.level_id = Level.actualizar.first.id
      end
      self.save
    end
    def permit(action) #accion como string
      return (self.level.actions.where(name: "#{action}").first != nil)
    end
    def add_points (points)
      self.points += points
      update_level
    end
end
