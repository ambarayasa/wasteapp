module Users
  class RegistrationController < ApiGuard::RegistrationController
    before_action :authenticate_resource, only: [:destroy]

    def create
      init_resource(sign_up_params)
      if resource.save
        create_token_and_set_header(resource, resource_name)
        jwt_and_refresh = jwt_and_refresh_token(resource, 'user')

        render json: {
          status: true,
          code: 200,
          message: "Sucessfully Create User",
          data: resource,
          token: jwt_and_refresh[0],
          refresh_token: jwt_and_refresh[1]
      }, status: :ok
      else
        render json: {
          status: false,
          code: 422, 
          message: "Failed to Create User!",
          data: resource.errors
      }, status: :unprocessable_entity
      end
    end

    def destroy
      current_resource.destroy
      render_success(message: I18n.t('api_guard.registration.account_deleted'))
    end

    private

    def sign_up_params
      params.require(:user).permit(
        :username,
        :password,
        :email,
        :name,
        :address,
        :gender,
        :balance,
        :role_id
    )
    end
  end
end
