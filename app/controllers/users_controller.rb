class UsersController < ApplicationController
    # before_action :authorize (jangan disini,di semua controller keknya)

    def create
        @user = User.create(user_params)

        if @user.valid?
            @user.save
            token_ = encode_token({user_id: @user.id})
            render json: {
                status: true,
                code: 200,
                message: "Sucessfully Create User",
                data: @user,
                token:token_
            }, status: :ok
        else
            render json: {
                status: false,
                code: 422, 
                message: "Failed to Create User!",
                data: @user.errors
            }, status: :unprocessable_entity
        end
    end

    def login
        @user = User.find_by_email(params[:email])

        if @user.present? && @user.authenticate(params[:password])
            token_ = encode_token({user_id: @user.id})

            render json: {
                status: true,
                code: 200,
                message: "Log in Sucessfully",
                data: @user,
                token:token_
            }, status: :ok
        else
            render json: {
                code: 401,
                message: "Email or Password is incorrect!"
            }, status: :unauthorized
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
