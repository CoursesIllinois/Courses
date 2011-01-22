class Course < ActiveRecord::Base
  belongs_to :major
  has_many :sections
  has_many :announcements
  has_many :users
end
