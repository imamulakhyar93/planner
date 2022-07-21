# frozen_string_literal: true

# Register the user to our application
class RegistrationsController < ApplicationController
  # POST /register
  def create
    user = User.new(register_params)
    if user.save
      render json: user
    else
      render_validation_errors(user.errors)
    end
  end

  private

  # Onyl allow a list of trusted parameters through.
  def register_params
    params.require(:user).permit(:email, :fullname, :password, :password_confirmation)
  end
end
