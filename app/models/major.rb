class Major < ActiveRecord::Base
	validates :subjectCode, :uniqueness => true
	has_many :courses
end
