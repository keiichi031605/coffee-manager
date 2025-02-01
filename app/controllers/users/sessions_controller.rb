class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    Rails.logger.info "######### Login action called #########"
    Rails.logger.info "Params: #{params.inspect}"
    super
  end

  private

  def respond_with(resource, _opts = {})
    if current_user
      Rails.logger.info "User logged in successfully: #{current_user.inspect}"
      render json: { user: current_user }, status: :ok
    else
      Rails.logger.info "Login failed: #{resource.errors.full_messages}"
      render json: { errors: ["Invalid email or password"] }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    Rails.logger.info "User logged out successfully" if current_user
    head :no_content
  end
end
