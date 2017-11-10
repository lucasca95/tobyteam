class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notifications
  has_many :votes
  has_many :reports
  has_many :questions
  has_many :answers
  has_many :comments

  has_one :university
  has_one :level

end
