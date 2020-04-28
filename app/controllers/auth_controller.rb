class AuthController < ApplicationController

def create
    @user = User.find_by(username: speakfriendandenter)
    if @user && @user.authenticate(speakfriendandenter[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, jwt: token}, status: :accepted
    else
        render json: {error: 'Bad login information. Usernames are sensitive'}, status :unauthorized
    end
end

def show
    user = User.find_by(id: user_id)
    if logged_in?
        render json: {id: user.id, username: user.username}
    else
        render json: {error: 'No user could be found'}, status: 401
    end
end


private

def speakfriendandenter
    params.require(:user).permit(:username, :password)
end

end

