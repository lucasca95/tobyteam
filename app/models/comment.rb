class Comment < ApplicationRecord
  
  belongs_to :user
  has_many :reports, as => :repotable
  belongs_to :commentable, :polimorphic => true

end
