class Sub < ApplicationRecord
  has_many :topics
  #has_one topic
  validates :name, presence: true
end
