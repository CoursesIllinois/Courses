class HomeController < ApplicationController
skip_before_filter :authenticate

def index
end

def teacher
  @isStudent = false
  session['isStudent'] = false
  redirect_to "/auth/google"
end

def student
  @isStudent = true
  session['isStudent'] = true
  redirect_to "/auth/google"
end

end
