class StudentController < ApplicationController
  before_filter :isStudent

  def isStudent
    unless current_user.isStudent
      redirect_to "/"
    end
  end
end
