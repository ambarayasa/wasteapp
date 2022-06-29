class UsersController < ApplicationController
    # before_action :authorize (jangan disini,di semua controller keknya)

    def create
        @user = User.create(user_params)

        if @user.valid?
            @user.save
            token_ = encode_token({user_id: @user.id})
            render json: {user: @user, token:token_}, status: :ok
        else
            render json: {error: 'Invalid Username or Password'}, status: :unprocessable_entity
        end
    end

    def login
        @user = User.find_by_email(params[:email])

        if @user.present? && @user.authenticate(params[:password])
            token_ = encode_token({user_id: @user.id})

            render json: {user: @user, token:token_}, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end
    
    
    private
    def user_params
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
