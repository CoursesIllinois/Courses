class SessionsController < ApplicationController
  
  def create
    auth = request.env['rack.auth']
    provider = auth['provider']
    provider_uid = auth['uid']
    user_info = auth['user_info']

    unless @auth = Authorization.find_by_provider_and_uid(provider, provider_uid)
      user = User.create(:firstname => user_info['first_name'], :lastname => user_info['last_name'], :email => user_info['email'])
      @auth = Authorization.create(:user => user, :provider => provider, :uid => provider_uid)
    end

    self.current_user = @auth.user 
    #render :text => "Welcome, #{session['user_id']}, #{current_user.firstname}" 
    redirect_to courses_path
  end
  
end
