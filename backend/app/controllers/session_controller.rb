class SessionController < ApplicationController
  def new
  end

  def create
    warden.authenticate!
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
