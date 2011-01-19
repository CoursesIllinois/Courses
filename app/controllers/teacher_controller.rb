class TeacherController < ApplicationController
  before_filter :isTeacher
  
  def isTeacher
    if current_user.isStudent
      redirect_to "/"
    end
  end
  
  def index
  end

  def announce 
    # Announcement.create(:type => params[:type], :dueDate => params[:dueDate], :title => params[:title], :description => params[:description], :isSection => params[:isSection])
  #  redirect_to teacher_path
  end

end
