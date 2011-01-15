class AnnounceController < ApplicationController

def index
end

def new
  @announcement = Announcement.new
end

def create 

    logger.debug "start" 
    logger.debug params.is_a?(Array)
    announceData = params[:announce]
    currentCourse = Course.find(announceData[:course_id])
    # Had to put in time manually
    dueData = params[:dueDate] 
    dueTime = Time.new(
                dueData[:year].to_i,
                dueData[:month].to_i,
                dueData[:day].to_i,
                dueData[:hour].to_i,
                dueData[:minute].to_i
              )
    @announcement = currentCourse.announcements.create(
                      :title => announceData[:title],
                      :description => announceData[:description],
                      :course_id => announceData[:course_id],
                      :dueDate => dueTime,
                      :type => announceData[:type]
                    )

    respond_to do |format|
      # if we could make the announcement, redirect to the teacher homepage, otherwise fail
      if @announcement.save
        format.html { redirect_to(teacher_index_path, :notice => "Announcement created!") }
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
