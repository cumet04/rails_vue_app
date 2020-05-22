class SessionController < ApplicationController
  def new
  end

  def create
    if params[:email].blank? || params[:password].blank?
      # This is abnormal case bacause frontend validates them
      head 400 and return
    end
    warden.authenticate! # TODO: page for failure
    redirect_to root_path
  end

  def destroy
    unless current_user
      # TODO: error page
      head 400
    end
    warden.logout
    redirect_to root_path
  end
end
