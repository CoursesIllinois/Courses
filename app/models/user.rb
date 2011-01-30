class User < ActiveRecord::Base

  def courses_form_data
    courses = []
    sections.each do |section|
      course = Course.find(section.course_id)
      course_name = course.subjectCode + " " + course.courseNumber.to_s
      unless courses.include?([course_name, section.course_id])
        courses << [course_name, section.course_id]
      end
    end
    return courses
  end

  #TODO add deletion of relation/mapping from users_sections when a user is destroyed
  has_and_belongs_to_many :sections
  has_and_belongs_to_many :courses

  has_many :authorizations, :dependent => :destroy

  has_one :notify_pref, :dependent => :destroy
  accepts_nested_attributes_for :notify_pref
  validates_presence_of :notify_pref
end
