class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessor :password, :password_confirmation

  has_one :profile, dependent: :destroy

  has_many :meetups_as_primary, class_name: "Meetup", inverse_of: :primary
  has_many :meetups_as_friend, class_name: "Meetup", inverse_of: :friend
  
  field :id, type: String
  
  field :name, type: String
  field :email, type: String
  
  field :salt, type: String
  field :fish, type: String
  
  field :code, type: String
  field :expires_at, type: Time
  
  before_save :encrypt_password
  
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  
  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end
  
  private
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end
end