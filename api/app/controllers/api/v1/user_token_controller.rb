class Api::V1::UserTokenController < Knock::AuthTokenController
  def create
    user = User.find_by_email params['auth']['email']
    user.update_attributes login_count: user.login_count + 1
    super
  end
end