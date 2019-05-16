class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :login_count

  has_one :profile
  has_one :business
  has_one :employer
end
