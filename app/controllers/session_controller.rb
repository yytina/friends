class SessionController < ApplicationController
  before_action :is_authenticated?, only: [ :destroy ]
  
  def new
    redirect_to root_url if current_user
  end
  
  def create
    # is the password blank?
    if params[:user][:password].blank?
      if @user = User.find_by(email: params[:user][:email])
        @user.code = SecureRandom.urlsafe_base64
        @user.expires_at = Time.now + 1.day
        @user.save

        UserMailer.reset_email(@user, request).deliver
        
        flash.now[:notice] = "An email with instructions for " +
          "reseting your password has been sent to you."
        render :new
      else
        @registrant = Registrant.new
        @registrant.id = SecureRandom.urlsafe_base64
        @registrant.email = params[:user][:email]
        @registrant.expires_at = Time.now + 1.day
        @registrant.save
        
        UserMailer.registration_email(@registrant, request).deliver
        
        flash.now[:notice] = "An email with instructions for " +
          "completing your registration has been sent to you."
        render :new
      end
    else
      # attempt to authenticate
      @user = User.find_by(email: params[:user][:email])
  
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_url
      else
        render :new, error: "Unable to sign you in. Please try again."
      end
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "You've logged out."
  end
end
