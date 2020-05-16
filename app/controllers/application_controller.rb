class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        # byebug
        JWT.encode(payload, 'fake_key')
    end
    
    def auth_header
        # byebug
        request.headers['Authorization']
    end

    def decoded_token
        # byebug
        if auth_header
            token = auth_header.split(' ')[0]
            begin
                JWT.decode(token, 'fake_key', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        # byebug
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        # byebug
        !!current_user
    end

    def authorized
        byebug
        render json: {message: 'Please sign up!'}, status: :unauthorized unless logged_in?
    end

end
