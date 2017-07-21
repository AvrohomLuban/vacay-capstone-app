class UserMailer < ApplicationMailer
  default from: 'itstimetovacay@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http:/localhost:3000/reports/indexall'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
