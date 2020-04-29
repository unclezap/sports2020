class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.create(whodat)
        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: {user: @user, jwt: token}, status: :accepted
        else
            render json: {error: 'failed to create user. Maybe try a different username?'}, status: :not_acceptable
        end
    end

    private

    def whodat
        params.require(:user).permit(:username, :password)
    end


end
