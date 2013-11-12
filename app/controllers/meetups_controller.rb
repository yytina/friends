class MeetupsController < ApplicationController
  # List all persons (show table of persons in HTML)
  def index
    present = Time.now
    year = present.year
    month = present.month
    day = present.day
    @today = Date.new(year, month, day)
  	@current_user=current_user
    @meetupsP = current_user.meetups_as_primary
    @meetupsF = current_user.meetups_as_friend
    @meetupDateComing=[]
    @event=[]

    @calendar=[]
    @calendarD=[]
    #offset=@today.wday-1
    fday=@today.beginning_of_week
    for i in 0..13
      @calendar[i]=fday+i
    end

    @calendarD=@calendar.map { |n| n.day }

    for i in 0..13
      @event[i]=[]
    end

    @meetupsF.each do |m| 
          meetup_year=m.meetup_at.year
          meetup_month=m.meetup_at.month
          meetup_day=m.meetup_at.day
          meetup_date= Date.new(meetup_year, meetup_month, meetup_day)
          meetup_time=formatTime(m.meetup_at.hour, m.meetup_at.min)
          if meetup_date > fday
            if meetup_date < fday + 14
              if m.acceptStatus 
                status="Agreed"
              else
                if (m.primary==current_user)
                  status="Waiting"
                else status="Respond"
                end
              end
              
              @event[meetup_date-fday] = [meetup_time,m, status]
            else
              # here means (meetup_date > fday && meetup_date > fday + 14)
            end
          else
            # here means (meetup_date < fday)
          end
    end

    @meetupsP.each do |m| 
          meetup_year=m.meetup_at.year
          meetup_month=m.meetup_at.month
          meetup_day=m.meetup_at.day
          meetup_date= Date.new(meetup_year, meetup_month, meetup_day)
          meetup_time=formatTime(m.meetup_at.hour, m.meetup_at.min)
          if meetup_date > fday
            if meetup_date < fday + 14
                if m.acceptStatus 
                status="Agreed"
              else
                if (m.primary==current_user)
                  status="Waiting"
                else status="Respond"
                end
              end
              
              @event[meetup_date-fday] = [meetup_time,m, status]
            else
              # here means (meetup_date > fday && meetup_date > fday + 14)
            end
          else
            # here means (meetup_date < fday)
          end
    end

    # TODO fill up all the gaps

   
  end
  
  
  # Show detail for a person with ID = params[:id] (in HTML)
  def show
    @meetup = Meetup.find_by(id: params[:id])
  end
  
  # Form for adding a new meetup (in HTML)
  def new
    @meetup = Meetup.new
    @user = User.find_by(id: params[:user_id])
  end
  
  # POST to this to create a new person, then redirect to show
  def create
    meetup = Meetup.new(meetup_params)
    meetup.friend = User.find_by(id: params[:user_id])
    meetup.primary = current_user
    meetup.acceptStatus=false
    meetup.meetup_at+=8.hour
    meetup.save
    
    redirect_to user_meetup_url(current_user, meetup)
  end
  
  # Form for updating a meetup with ID = params[:id] (in HTML)
  def edit
    @user = current_user
    @meetup = Meetup.find_by(id: params[:id])
    if (@meetup.primary != @user) then
      @meetup.friend = @meetup.primary
      @meetup.primary = @user
    end
    @meetup.save
  end
  
  # PUT or PATCH to this to update person with ID = params[:id]
  # then redirect to show
  
  def accept
    @meetup = Meetup.find_by(id: params[:id])
    @meetup.acceptStatus = true
    @meetup.save
    
    redirect_to user_meetup_url(current_user, @meetup)
  end

  def update
    @meetup = Meetup.find_by(id: params[:id])
    @meetup.update_attributes(meetup_params)
    @meetup.meetup_at+=8*60*60
    @meetup.save
    
    redirect_to user_meetup_url(current_user, @meetup)
  end
  
  # Destroy the person with ID = params[:id]
  # then redirect to index to list remaining persons
  def destroy
    @meetup = Meetup.find_by(id: params[:id])
    @meetup.destroy
    
    redirect_to user_meetups_url(current_user)
  end
  
  private

  def parse_meetup_at(params)
    year = params[:meetup].delete(:"meetup_at(1i)")
    month = params[:meetup].delete(:"meetup_at(2i)")
    day = params[:meetup].delete(:"meetup_at(3i)")
    hour = params[:meetup].delete(:"meetup_at(4i)")
    minute = params[:meetup].delete(:"meetup_at(5i)")

    Time.new(year, month, day, hour, minute)
  end
  
  def meetup_params
    params.require(:meetup).permit(
      :place, :is_coffee, :is_beer
    ).merge({meetup_at: parse_meetup_at(params)} )

    # params.merge({meetup: {meetup_at: parse_meetup_at(params)} } )
  end

  def formatTime(h,m)
    hString = h.to_s
    mString = m.to_s
    if h<10
      hString="0"+h.to_s
    end

    if m<10
      mString="0"+m.to_s
    end

    "@"+hString+":"+mString
  end

end