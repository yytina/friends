class RegistrationController < ApplicationController
  
  def new
    @registrant = Registrant.find_by(id: params[:code])
    
    if @registrant && @registrant.expires_at > Time.now
      render :new
    else
      redirect_to login_url, error: "Sorry, your code has expired. Please try again."
    end
  end
  
  def create
    @registrant = Registrant.find_by(id: params[:code])

    @user = User.new(user_params)
    @user.email = @registrant.email
    
    if @user.save
      @registrant.destroy
      
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for registering!"
    else
      flash.now[:error] = "Something went wrong. Please check your data and try again."
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :password_confirmation
    )
  end
end
