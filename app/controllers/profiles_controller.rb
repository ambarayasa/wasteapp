class ProfilesController < ApplicationController

    def show
        @user = User.find_by(username: profile_params)
        render json: {
            name: @user.name
        }, status: :ok
    end

    private
    def profile_params
        params.require(:profile).permit(:username)
    end
end
