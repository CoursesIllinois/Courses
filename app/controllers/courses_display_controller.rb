=begin
  This controller is responsible for displaying the course selection
  scene as well as powering the add/remove section functions for the session
=end  
class CoursesDisplayController < ApplicationController

layout "coursesdisplay"

# Retrieves the current users sections
  def users_sections
    unless session[:mySections]
      session[:mySections] = []
    end
    session[:mySections]
  end

  def add_section
    @mySections = users_sections
    @mySections << params[:section_id].to_i
    respond_to {|format| format.js}
    flash['notice'] = "Section " + params[:section_id] + " Added!"
    #redirect_to '/courses/'
  end
  
  def remove_section
    @mySections = users_sections
    if( params[:section_id].to_i == @mySections.delete(params[:section_id].to_i))
        flash['notice'] = "Section "+ params[:section_id] + " removed!"
    end
    logger.debug "MySections: #{session[:mySections]}"
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

    def save_sections
      # make sure the users sections are clear
      current_user.sections = []
      session[:mySections].each do |section|
        current_user.sections << Section.find(section)
      end
      if session[:isStudent]
        redirect_to student_index_path
      else
        redirect_to teacher_index_path
      end
    end
	
	def index
		@majors = Major.all
        unless session[:mySections]
          session[:mySections] = []
          current_user.sections.each do |section|
            session[:mySections] << section.id.to_i
          end
        end
        @mySections = session[:mySections]
	end
end
