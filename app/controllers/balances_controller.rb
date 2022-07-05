class BalancesController < ApplicationController
    # Params :  
    # Amount
    # target_email
    # from_email that must admin

    before_action :authenticate_and_set_user

    def add_balance
        @user = User.find_by(email: params[:target_email].downcase.strip)
        @user.update_attribute(:balance, @user.balance += params[:amount])
        render json: {
            status: "true",
            code: 200,
            message: "#{params[:amount]} has been added on #{@user.username}, current balances #{@user.balance}"
        }, status: :ok
    end

    def withdraw_balance
        @user = User.find_by(email: params[:target_email].downcase.strip)
        if (@user.balance - params[:amount]) >= 0
            @user.update_attribute(:balance, @user.balance -= params[:amount])
            render json: {
                status: "true",
                code: 200,
                message: "#{params[:amount]} has been deducted on #{@user.username}, current balances #{@user.balance}"
            }, status: :ok
        else 
            render json: {
                status: false,
                code: 422,
                message: "not sufficient balances"
            }, status: :unprocessable_entity
        end
    end
end
