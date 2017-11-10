class Comment < ApplicationRecord
  
  belongs_to :user
  has_many :reports, :as => :repotable
  belongs_to :commentable, :polymorphic => true

end
