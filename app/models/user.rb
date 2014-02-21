class User
  include Mongoid::Document

  field :id,            type: Integer
  field :username,      type: String
  field :email,     type: String

  def get_name
    self.name
  end
end