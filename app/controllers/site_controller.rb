class SiteController < ApplicationController
  before_action :is_authenticated?, only: [ :index ]
  
  def index
    @users = User.all.entries
  end
  
  def privacy
    
  end
  
  def terms
    
  end
end