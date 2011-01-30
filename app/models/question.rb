class Question < ActiveRecord::Base
  validates :title, :presence => true
  belongs_to :user
#  has_one :answer
#  has_many :responses
#  has_many :comments
end
