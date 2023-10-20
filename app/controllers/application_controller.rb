class ApplicationController < ActionController::API

  private
  def authorize_request
    header = request.headers['x-auth']
    raise StandardError, "Unauthorized Login" if header.nil?
    header = header.split(' ').last if header
      @decoded = XAuth.decode(header)
      @current_user = @decoded[:user_id]
      raise StandardError, "Unauthorized Login" if @current_user.nil?
  rescue StandardError => e
      render json: { errors: e.message }, status: :unauthorized
  end
end
