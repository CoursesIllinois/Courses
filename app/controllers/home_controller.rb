class HomeController < ApplicationController
skip_before_filter :authenticate

def index
end

def teacher
  logger.debug "Teacher!\n"
  session['isStudent'] = false
  redirect_to "/auth/google"
end

def student
  logger.debug "student\n"
  session['isStudent'] = true
  redirect_to "/auth/google"
end

end
