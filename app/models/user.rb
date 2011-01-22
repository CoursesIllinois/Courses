class User < ActiveRecord::Base

  def courses
    courses = []
    sections.each do |section|
      course = Course.find(section.course_id)
      course_name = course.subjectCode + " " + course.courseNumber.to_s
#      unless courses.include?({:name => course_name, :id => section.course_id})
#        courses << {:name => course_name, :id => section.course_id}
      unless courses.include?([course_name, section.course_id])
        courses << [course_name, section.course_id]
      end
    end
    return courses
  end

  has_and_belongs_to_many :sections
  has_and_belongs_to_many :courses
  #TODO add deletion of relation/mapping from users_sections when a user is destroyed
  has_many :authorizations, :dependent => :destroy
  has_one :notify_pref, :dependent => :destroy
end
