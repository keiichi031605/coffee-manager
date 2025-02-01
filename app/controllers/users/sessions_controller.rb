class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    puts '###'
    puts params
    puts '###'
    render json: { user: resource, token: request.env['warden-jwt_auth.token'] }, status: :ok
  end

  def respond_to_on_destroy
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
