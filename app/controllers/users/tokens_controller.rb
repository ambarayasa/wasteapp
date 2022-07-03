module Users
  class TokensController < ApiGuard::TokensController
    before_action :authenticate_resource, only: [:create]
    before_action :find_refresh_token, only: [:create]

    def create
      create_token_and_set_header(current_resource, resource_name)

      @refresh_token.destroy
      blacklist_token if ApiGuard.blacklist_token_after_refreshing

      jwt_and_refresh = jwt_and_refresh_token(current_resource, 'user')
    
      render json: {
        status: true,
        code: 200,
        message: "Sucessfully Refresh Token",
        token: jwt_and_refresh[0],
        refresh_token: jwt_and_refresh[1]
    }, status: :ok
    end

    private

    def find_refresh_token
      refresh_token_from_header = request.headers['Refresh-Token']
    
      if refresh_token_from_header
        @refresh_token = find_refresh_token_of(current_resource, refresh_token_from_header)
        
        unless @refresh_token
          render json: {
            status: false,
            code: 401,
            message: "Invalid Refresh token",
        }, status: :unauthorized 
        end
      else
        render json: {
          status: false,
          code: 401,
          message: "Refresh token is missing in the request",
      }, status: :unauthorized
      end
    end
  end
end
