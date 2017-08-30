class UserMailer < ApplicationMailer
  default from: 'no-reply@house-holder.herokuapp.com'

  def confirmation_email(user)
    @user = user
    @url  = confirm_url(@user.confirm_token)
    mail(to: @user.email, subject: 'Confirm your Email Address')
  end
end
