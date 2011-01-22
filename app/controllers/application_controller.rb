class ApplicationController < ActionController::Base

  # Keys for tropo api calls
  @@messaging_token = "1bfbc049ce83714697a6d23c43e584f10447935ec48b23414e6162b9cb808d84cec845ea4bac4ca2a24c818c"
  @@api_url = 'http://api.tropo.com/1.0/sessions?action=create&token=' + @@messaging_token

  before_filter :authenticate

  def authenticate 
    flash['notice'] = ""
    if not signed_in?
      redirect_to welcome_path  
      flash['notice'] = "You need to be signed in to do that!"
    end
  end

  def send_text(phone, message)
    message = URI.escape(message, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    api_call = @@api_url + "&contactNumber=" + phone + "&msg=" + message
    Net::HTTP.get URI.parse(api_call)
  end

  protect_from_forgery

  protected

  # Retrieve the current user, set the user if not already
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  # Returns whether or not the user is signed in
  def signed_in?
    !!current_user
  end

  # Redirect to the homepage of the user
  def redirect_to_home
    if @current_user.isStudent
      redirect_to student_index_path
    else
      redirect_to teacher_index_path
    end
  end

  helper_method :current_user, :signed_in?, :redirect_to_home

  # Helper method to assign and set user in session
  def current_user=(user)
      @current_user = user
      session[:user_id] = user.id
  end

end
