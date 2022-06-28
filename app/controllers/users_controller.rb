class UsersController < ApplicationController
    skip_before_action :authorize, only:[:create]

    def create
        @user = User.create(user_params)

        if @user.valid?
            token_ = encode_token({user_id: @user.id})

            render json: {user: @user, token:token_}, status: :ok
        else
            render json: {error: 'Invalid Username or Password'}, status: :unprocessable_entity
        end
    end
    
    
    private
    def user_params
        params.require(:user).permit(
            :username,
            :password_digest,
            :email,
            :name,
            :address,
            :gender,
            :balance,
            :role_id
        )
    end

end
