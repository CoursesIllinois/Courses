class AnnounceController < ApplicationController

def index
end

def new
  @announcement = Announcement.new
end

def create 
    announceData = params[:announce]
    currentCourse = Course.find(announceData[:course_id])
    # Had to put in time manually
    date = params['date'] 
    time = params['time'] 

    # TODO: Turn into shorthand for ease and better error handling

    if (date['year'] == "" or date['year'] == "" or date['year'] == "") 
      dueDate = nil
    else
      dueDate = Date.new( date[:year].to_i, date[:month].to_i, date[:day].to_i)
    end


    if (time[:hour] == "" or time[:minute] == "")
      dueTime = nil
    else
      dueTime = Time.new(
                  date[:year].to_i,
                  date[:month].to_i,
                  date[:day].to_i,
                  time[:hour].to_i,
                  time[:minute].to_i
                )
    end

    logger.debug "Time: #{dueTime}"
    logger.debug "Date: #{dueDate}"
=begin
    @announcement = currentCourse.announcements.create(
                      :title => announceData[:title],
                      :description => announceData[:description],
                      :course_id => announceData[:course_id],
                      :dueDate => dueTime,
                      :type => announceData[:type]
                    )
=end
    @announcement = Announcement.new
    @announcement.title = announceData[:title]
    @announcement.description = announceData[:description]
    @announcement.course_id = announceData[:course_id]
    @announcement.dueTime = dueTime
    @announcement.dueDate = dueDate
    @announcement.atype = announceData[:atype]

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
