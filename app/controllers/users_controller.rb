class UsersController < ApplicationController
  def new
    home_if_logged_in
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!
    if @user.save
      UserMailer.confirmation_email(@user).deliver
      redirect_to home_path
    else
      flash.now[:errors] = @user.errors.full_messages
      render 'new'
    end
  end

  def confirm
    user = User.find_by_confirm_token(params[:token])
    if user
      user.email_activate
      flash[:notice] = "Email Successfully Verified!"
    else
      flash[:alert] = "Oops! Something went wrong."
    end
  end

  private

  def user_params
     params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
