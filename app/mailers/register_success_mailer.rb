class RegisterSuccessMailer < ApplicationMailer
  def send_password(user, password)
    @user = user
    @content = "Hello " + @user.username + "!"
    @content += "Welcome to LinkLab, please use your below credentials to login:"
    @content += "Your account: " + @user.email
    @content += "Your password: " + password
    mail(to: @user.email, subject: "LinkLab Email")
  end
end
