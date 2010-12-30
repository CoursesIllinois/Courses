class Major < ActiveRecord::Base
	validates :subjectCode, :uniqueness => true
	validates :phone, :numericality => true
	has_many :courses
end
