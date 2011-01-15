class AnnounceController < ApplicationController

def index
end

def new
  @announcement = Announcement.new
end

def create 
    currentCourse = Course.find(params[:announce][:course_id])
    @announcement = currentCourse.announcements.create(params[:announce])

    respond_to do |format|
      if @announcement.save
        format.html 
        format.xml  { render :xml => @announcement, :status => :created }
      else
        format.html { render :action => "new" }
#        format.xml  { render :xml => @announcement.errors, :status => :unprocessable_entity }
      end
    end 
end

def show
end

end
