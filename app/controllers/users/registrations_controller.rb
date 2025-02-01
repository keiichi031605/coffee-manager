class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    Rails.logger.info "######### Create action called #########"
    Rails.logger.info "Params: #{params.inspect}"
    super
  end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      Rails.logger.info "User created successfully: #{resource.inspect}"
      render json: { user: resource }, status: :created
    else
      Rails.logger.info "User creation failed: #{resource.errors.full_messages}"
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
