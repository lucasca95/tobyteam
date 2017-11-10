class Comment < ApplicationRecord
  
  belongs_to :user
  has_many :reports, :as => :reportable
  belongs_to :commentable, :polymorphic => true

end
