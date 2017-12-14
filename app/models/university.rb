class University < ApplicationRecord
	has_many :users


  def self.topquestion
    select('universities.*, COUNT(questions.id) AS questions_count').
      joins("FULL OUTER  JOIN \"users\" ON \"users\".\"university_id\" = \"universities\".\"id\"").                                                   
      joins("FULL OUTER  JOIN \"questions\" ON \"users\".\"id\" = \"questions\".\"user_id\"").                                                   
      where("universities.name is not null").
      group('universities.id').
      order('questions_count desc').limit(1)
  end

  def questions
  		Question.
      joins("FULL OUTER  JOIN \"users\" ON \"users\".\"id\" = \"questions\".\"user_id\"").                                                   
      joins("FULL OUTER  JOIN \"universities\" ON \"users\".\"university_id\" = \"universities\".\"id\"").                                                   
      where("universities.id = #{self.id}")
  end


end
