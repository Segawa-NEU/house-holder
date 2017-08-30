class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    @user.email.downcase!
    if @user.save
      UserMailer.confirmation_email(@user).deliver
      #TODO to home and confirmation email
      render 'new'
    else
      render 'new'
    end
  end

  def confirm
    user = User.find_by_confirm_token(params[:token])
    if user
      user.email_activate
      #TODO redirect to home
      redirect_to '/welcome' #temporal
    else
      # TODO send error somehow
      redirect_to '/welcome' #temporal
    end
  end

  private

  def user_params
     params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
