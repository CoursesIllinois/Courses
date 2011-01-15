class Announcement < ActiveRecord::Base
#  symbolize :type, :in => [:Homework, :Quiz, :Exam, :General], :scopes => true

  belongs_to :courses
  belongs_to :sections
end
