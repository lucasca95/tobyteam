class Vote < ApplicationRecord
  belongs_to :votable, :polimorphic => true
  belongs_to :user
end
