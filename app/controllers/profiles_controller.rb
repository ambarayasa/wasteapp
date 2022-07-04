class ProfilesController < ApplicationController
    before_action :authenticate_and_set_user
    
    def show
        @user = User.find_by(email: params[:email].downcase.strip)
        render json: {
            status: "true",
            code: 200,
            data: {
                name: @user.name,
                username: @user.username,
                email: printCensoredEmail(@user.email),
                address: @user.address,
                balance: printBalance(@user.balance),
                role: printRole(@user.role_id)
            }
        }, status: :ok
    end

    private
    def printCensoredEmail(email)
        censoredEmail = email.sub(/\A(..)(.*)@(.*)\z/) {
            # \A = start of string
            # (..) = Group 1, capturing any 2 chars
            # (.*) = Group 2, capturing any 0+ chars as many as possible up the last...
            # @ = @ char
            # (.*) group 3, capturing any 0+ chars as many as possible up the last..
            # \z = end of string
            $1 + "*"*$2.length + "@" + $3
        }

        return censoredEmail
    end

    def printBalance(balance)
        return "Rp.#{balance}"
    end

    def printRole(roleId)
        @role = Role.find_by(id: roleId)
        return @role.role
    end

end
