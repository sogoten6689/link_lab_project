class ApplicationMailer < ActionMailer::Base
  default from: 'lamnguyen04.97@gmail.com'
  layout 'mailer'

  def send_password(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: "Welcome to LinkLab!")
  end
end
