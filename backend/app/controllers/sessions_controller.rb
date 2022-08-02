# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by_email(login_params[:email])
    if user&.authenticate(login_params[:password])
      exp = (Time.now + 1.day).to_i
      payload = { user_id: user.id, exp: }
      token = JWT.encode payload, nil, 'none'
      return render json: { token: }
    end
    render_authentication_errors
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
