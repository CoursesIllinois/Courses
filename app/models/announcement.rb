class Announcement < ActiveRecord::Base
#  symbolize :type, :in => [:Homework, :Quiz, :Exam, :General], :scopes => true

  def self.types
    [:Homework, :Quiz, :Exam, :General]
  end

  belongs_to :courses
  belongs_to :sections
end
