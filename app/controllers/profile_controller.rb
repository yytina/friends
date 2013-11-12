class ProfileController < ApplicationController
  before_action :is_authenticated?

  # List all profiles (show table of profiles in HTML)
  def index
    @profiles = Profile.all.entries
  end
  
  # Show detail for a profile with ID = params[:id] (in HTML)
  def show
    @profile = Profile.find_by(id: params[:id])
  end

  def show_current
    @profile = current_user.profile
    if !@profile then
      @profile=Profile.new
      @profile.user=current_user
      @profile.name=current_user.name
      @profile.save
      flash.now[:notice] = "Your profile is created." +
          "Please edit your profile."
      #redirect_to edit_current_url unless @profile
    end
    
    render :show
  end

  def search
    
    @result_profiles=[]
    Profile.each do |p|
      score = 0
      for i in 0..p.subjects.length-1
        for j in 0..current_user.profile.subjects.length-1
          if p.subjects[i].keyword== current_user.profile.subjects[j].keyword then
            
              score += current_user.profile.subjects[j].weight
              
            
          end
        end
      end
      if p !=current_user.profile then
        @result_profiles.push([p,score])
      end
    end
    @result_profiles.sort! { |a,b| b[1] <=> a[1]  }

  end
  
  
  # Form for updating a profile with ID = params[:id] (in HTML)
  
  def edit
    @profile = Profile.find_by(id: params[:id])
  end

  def edit_current
    @profile = current_user.profile
    render :edit
  end
  
  # PUT or PATCH to this to update profile with ID = params[:id]
  # then redirect to show
  def update
    @profile = Profile.find_by(id: params[:id])
    @profile.update(profile_params)
    
    redirect_to root_url
  end
  
  
  private
  
  def profile_params
    params.require(:profile).permit(
      :name, {subjects_attributes: [:id, :keyword, :weight,:thoughts,:questions, :_destroy]}
    )
  end
end