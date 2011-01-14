class TeacherController < ApplicationController
  
  def index
  end

  def announce 
    # Announcement.create(:type => params[:type], :dueDate => params[:dueDate], :title => params[:title], :description => params[:description], :isSection => params[:isSection])
  #  redirect_to teacher_path
  end

end
