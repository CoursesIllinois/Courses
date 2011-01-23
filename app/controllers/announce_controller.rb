class AnnounceController < ApplicationController

def index
end

def new
  @announcement = Announcement.new
end


# Takes in the input from the _form for announcement and parse the data into a new announcement object
def create 
    announceData = params[:announce]
    #currentCourse = Course.find(announceData[:course_id])
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

    @announcement = Announcement.new
    @announcement.title = announceData[:title]
    @announcement.description = announceData[:description]
    @announcement.course_id = announceData[:course_id]
    @announcement.dueTime = dueTime
    @announcement.dueDate = dueDate
    @announcement.atype = announceData[:atype]


	# Initiate the notifications to send to the course users
    send_notifications(announceData[:course_id], @announcement)
    
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


#	This function sends notifications to course users
#	 	@params course_id = Course id of the course that needs notifications sent to it
#	    @params announcement =  Announcement object to be broadcast to all users
def send_notifications(course_id, announcement)
  course = Course.find(course_id)
	message = "(#{course.subjectCode}-#{course.courseNumber}) New #{announcement.atype} Posted: #{announcement.title} is Due On #{announcement.dueDate}"
	logger.debug message
	
	# Iterate through the users courses and send them the message
  course.users.each do |user|
    if user.phone and user.isStudent
      logger.debug "Sending text to: #{user.phone}"
			send_text(user.phone, message)
    end
  end
end

end
