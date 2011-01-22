class MessagingController < ApplicationController

	require 'uri'
	require 'net/http'
	require 'tropo-webapi-ruby'

  skip_before_filter :authenticate

  # This function takes in message text and contact from tropo's get request
  # Generates a json response instructing tropo to deliver the message to the contact           
  def index 
    logger.debug params
    message = URI.unescape(params['session']['parameters']['msg'])
    logger.debug message

    number = params['session']['parameters']['contactNumber']
    tropo_session = Tropo::Generator.message({ :say => {:value => message}, :to => number, :channel => 'TEXT', :network => 'SMS'})
    render :json =>  tropo_session
  end

  def test
    render :xml => send_text("16097851404", "This is an example of a message");
  end

end
