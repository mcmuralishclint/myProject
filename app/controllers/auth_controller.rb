class AuthController < ApplicationController
  def login
    render json: { token: XAuth.encode({user_id: "TEST"}) }, status: :ok
  end
end