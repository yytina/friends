class Subject 
  include Mongoid::Document

  embedded_in :profile

  field :keyword, type: String
  field :weight, type: Integer
  field :thoughts, type: String
  field :questions, type: String
end