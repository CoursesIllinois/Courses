class SessionsController < ApplicationController
  
  def create
    render :text => request.env['rack.auth']
  end
  
end
