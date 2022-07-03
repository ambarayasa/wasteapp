module Users
  class AuthenticationController < ApiGuard::AuthenticationController
    before_action :find_resource, only: [:create]
    before_action :authenticate_resource, only: [:destroy]

    def create
      if resource.authenticate(params[:password])
        create_token_and_set_header(resource, resource_name)
        jwt_and_refresh = jwt_and_refresh_token(resource, 'user')

        render json: {
          status: true,
          code: 200,
          message: "Log in Sucessfully",
          data: resource,
          token: jwt_and_refresh[0],
          refresh_token: jwt_and_refresh[1]
      }, status: :ok
      else
        render json: {
          status: false,
          code: 422,
          message: "Invalid login Credentials"
      }, status: :unprocessable_entity
      end
    end

    def destroy
      blacklist_token
      render_success(message: I18n.t('api_guard.authentication.signed_out'))
    end

    private

    def find_resource
      self.resource = resource_class.find_by(email: params[:email].downcase.strip) if params[:email].present?
      render_error(422, message: I18n.t('api_guard.authentication.invalid_login_credentials')) unless resource
    end
  end
end
