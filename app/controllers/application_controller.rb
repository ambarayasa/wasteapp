class ApplicationController < ActionController::API

    def encode_token(payload)
        JWT.encode(payload, "S3CReT_t0k3n!")
    end
    
end
