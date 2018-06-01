class Api::ApiController < ApplicationController

  before_action :require_login!

  def require_login!
    if authentication_success?
      return true
    else
      render json: { errors: [detail: "Access Denie"]}, status: 401
    end
  end

  private

  def authentication_success?
    token = request.headers['HTTP_AUTHORIZATION']

    return false if !token || token.blank?

    user = User.find_by_auth_token(request.headers['HTTP_AUTHORIZATION'])

    if user
      sign_in(user)
      return true
    else
      return false
    end
  end

end
