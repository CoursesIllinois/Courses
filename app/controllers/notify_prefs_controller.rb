class NotifyPrefsController < ApplicationController
  before_filter :get_user

  def show
    @notify_pref = @user.notify_pref
  end

  def create
    @notify_pref = @user.notify_pref.create(params[:notify_pref])
  end

  def update
    @notify_pref = @user.notify_pref

    respond_to do |format|
      if @notify_pref.update_attributes(params[:notify_pref])
        format.html { redirect_to(@notify_pref, :notice => 'Preferences successfully updated') }
        format.xml { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @notify_pref.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end
end
