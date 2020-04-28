class UsersController < ApplicationController

    def create
        @user = User.create(whodat)
        if @user.valid?
            render json: @user
        else
            render json: {error: 'failed to create user. Maybe try a different username?'}, status: :not_acceptable
        end
    end

    private

    def whodat
        params.require(:user).permit(:username, :password)
    end


end
