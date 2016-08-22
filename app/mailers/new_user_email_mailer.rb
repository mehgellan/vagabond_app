class NewUserEmailMailer < ApplicationMailer
  default from: "swittervagabond@gmail.com"
  
  def notify_user(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Vagabond. Are you ready to travel?")
  end
end
