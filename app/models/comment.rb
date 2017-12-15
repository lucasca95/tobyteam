class Comment < ApplicationRecord
  
  belongs_to :user
  has_many :reports, :as => :reportable, dependent: :destroy
  belongs_to :commentable, :polymorphic => true

  #Validaciones
	validates :body,
	presence: true
	validates :body,
	length: { minimum: 0, maximum: 250 }

end
