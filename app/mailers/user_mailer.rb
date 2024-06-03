class UserMailer < ActionMailer::Base
  default :from => "alinamakosejtschuk@gmail.com"

  def application_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
