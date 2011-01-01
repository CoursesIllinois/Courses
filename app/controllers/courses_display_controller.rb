class CoursesDisplayController < ApplicationController
	def major
		@major = Major.find(:first, :conditions => {:subjectCode => params[:major]})
	end

	def course
		@major = Major.find(:first, :conditions => {:subjectCode => params[:major]})
		@course = @major.courses.find(:first, :conditions => {:courseNumber => params[:course]})
	end
	
	def index
		@majors = Major.all
	end
end
