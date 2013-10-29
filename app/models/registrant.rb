class Registrant
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :id, type: String
  field :email, type: String
  field :expires_at, type: Time
end