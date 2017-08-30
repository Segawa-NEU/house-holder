class SessionsController < ApplicationController
  def new
    home_if_logged_in
  end

  def create
    user = User.find_by(username: session_params[:username])
    if user && user.authenticate(session_params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to home_path;
    else

    end
  end

  private
  def session_params
     params.require(:session).permit(:username, :password)
  end
end
