require 'jwt'

class ApplicationController < ActionController::API
    # Check token
    before_action :authorize

    def encode_token(payload, exp = 1.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, "S3CReT_t0k3n!")
    end
    
    def decode_token
        # Bearer eyJhbGciOiJIUzI1NiJ9.eyJpeCI6MTcsImV4cCI6MTY1NjM0MDI1N30.XhXvT_Ft4Zdp1vsMxUpQ5k2eGetWHtdxFofLbR8_sDo

        auth_header = request.headers["Authorization"]
        if auth_header
            token = auth_header.split(' ')[1]

            begin
                JWT.decode(token, "S3CReT_t0k3n!", true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def authorized_user
        decoded_token = decode_token()
        
        if decode_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def authorize
        render json: {message: 'You have to log in'}, status: :unauthorized unless 
        authorized_user
    end
end
