class Profile 
  include Mongoid::Document

  belongs_to :user
  embeds_many :subjects

  accepts_nested_attributes_for :subjects, :allow_destroy =>true

  field :name
end