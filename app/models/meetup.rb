class Meetup 
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  belongs_to :primary, class_name: "User", inverse_of: :meetups_as_primary
  belongs_to :friend, class_name: "User", inverse_of: :meetups_as_friend

  field :request_person, type: Boolean
  field :meetup_at, type: Time
  field :place, type: String

  
  field :is_coffee, type: Boolean
  field :is_beer, type: Boolean
  field :acceptStatus, type: Boolean

  field :expires_at, type: Time
end