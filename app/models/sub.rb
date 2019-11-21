class Sub < ApplicationRecord
  #certain db constraints
  validates :name, presence: true 
  validates :name, uniqueness: true

  has_many :topics
end
