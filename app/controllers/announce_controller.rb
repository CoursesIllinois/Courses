class AnnounceController < ApplicationController

def index
end

def new
  @announcement = Announcement.new
end

def create 
    logger.debug "WHT THE FUCK"
    announceData = params[:announce]
    logger.debug params
    logger.debug announceData
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
  
    logger.debug dueTime
    logger.debug "WHT THE FUCK"

    @announcement = currentCourse.announcements.create(
                      :title => announceData[:title],
                      :description => announceData[:description],
                      :course_id => announceData[:course_id],
                      :dueDate => dueTime
                    )

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
