class Course < ActiveRecord::Base
  belongs_to :major
  has_many :sections
  has_many :announcements
  has_and_belongs_to_many :users
end
