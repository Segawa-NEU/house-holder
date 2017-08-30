class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_from_session
    User.find_by(id: session[:user_id])
  end

  def home_if_logged_in
    if user_from_session
      redirect_to home_path
    end
  end

  def welcome_if_logged_out
    if user_from_session
      redirect_to home_path
    end
  end
end
