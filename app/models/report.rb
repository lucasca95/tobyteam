class Report < ApplicationRecord
  belongs_to :reportable, :polimorphic => true
  belongs_to :user

end
