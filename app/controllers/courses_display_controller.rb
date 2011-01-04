=begin
  This controller is responsible for displaying the course selection
  scene as well as powering the add/remove section functions for the session
=end  
class CoursesDisplayController < ApplicationController

# Retrieves the current users sections
  def users_sections
    unless session[:mySections]
      session[:mySections] = []
    end
    session[:mySections]
  end

  def add_section
    @mySections = users_sections
    @mySections << params[:section_id]
    respond_to {|format| format.js}
    flash['notice'] = "Section " + params[:section_id] + " Added!"
    #redirect_to '/courses/'
  end
  
  def remove_section
    @mySections = users_sections
    if( params[:section_id] == @mySections.delete(params[:section_id]))
        flash['notice'] = "Section "+ params[:section_id] + " removed!"
    end
    respond_to do |format|
      format.js
    end
  end
  
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
	
	def index
		@majors = Major.all
	end
	
end
