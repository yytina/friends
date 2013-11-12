class ProfilesController < ApplicationController
  
  def index
    @profiles = Profile.all.entries
    
    render json: @profiles
  end
  
  def show
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
    @profile = Profile.find_by(id: params[:id])
    @profile.delete
    
    head :no_content
  end
end