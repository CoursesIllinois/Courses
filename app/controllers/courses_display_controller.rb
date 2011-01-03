class CoursesDisplayController < ApplicationController
	def course
		@major = Major.find(:first, :conditions => {:subjectCode => params[:major]})
		respond_to do |format|
	    format.js
	  end
	end

	def section
		@major = Major.find(:first, :conditions => {:subjectCode => params[:major]})
		@course = @major.courses.find(:first, :conditions => {:courseNumber => params[:course]})
		respond_to do |format|
		  format.js
	  end
	end
	
	def major
	end
	
	def index
		@majors = Major.all
	end
	
end
