class TeacherController < ApplicationController
  
  def index
  end

  def createAnnouncement
    Announcement.create( 
    redirect_to teacher_path
  end

end
