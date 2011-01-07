class SessionsController < ApplicationController
skip_before_filter :authenticate
  
  def create
    auth = request.env['rack.auth']
    provider = auth['provider']
    provider_uid = auth['uid']
    user_info = auth['user_info']

    if session['isStudent']
      logger.debug "Student is logging in"
    else
      logger.debug "Teacher is logging in"
    end
#    logger.debug "The session shows #{session['isStudent']}"

    # Check and see if the authorization exists
    unless @auth = Authorization.find_by_provider_and_uid(provider, provider_uid)
      # If the authorization doesn't exist, this must be a new user
      user = User.create(:isStudent => session['isStudent'], :firstname => user_info['first_name'], :lastname => user_info['last_name'], :email => user_info['email']) 
    
      logger.debug "Creating a new user and authorization"
      #user = User.create(:isStudent => isStudent )
      # Link the new authorization to the new user
      @auth = Authorization.create(:user => user, :provider => provider, :uid => provider_uid)
    end

    self.current_user = @auth.user 
    #render :text => "Welcome, #{session['user_id']}, #{current_user.firstname}" 
    redirect_to courses_path
  end
  
end
