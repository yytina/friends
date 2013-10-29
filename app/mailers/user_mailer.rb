class UserMailer < ActionMailer::Base
  default from: "friends <admin@friends.com>"
  
  def reset_email(user, request)
    @user = user
    @host = request.protocol + request.host_with_port
    
    mail to: @user.email, subject: "friends: Reset your credentials"
  end
  
  def registration_email(registrant, request)
    @registrant = registrant
    @host = request.protocol + request.host_with_port
    
    mail to: @registrant.email, subject: "friends: Complete your registration"
  end
end