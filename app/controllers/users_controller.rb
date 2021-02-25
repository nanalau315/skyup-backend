class UsersController < ApplicationController
    defore_action :authenticate, only: [:show]

    def signup
        @user = User.create(username: params[:username], password: params[:password])
        if @user.valid?
            token = JWT.encode({user_id: @user.id}, "5KyuPy0uR5ky6yn4n414u", "HS256")
            render json: {user: UserSerializer.new(@user), token: token}
        else
            render json: {errors: @user.errors.full_messages.sort.reverse}, status: :unauthorized
        end
    end

    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token = JWT.encode({ user_id: @user.id }, "5KyuPy0uR5ky6yn4n414u", "HS256")
            render json: { user: UserSerializer.new(@user), token: token}
        else
            render json: { errors: ["Invalid Username or Password!"] }, status: :unauthorized
        end 
    end

    def show
        render json: @current_user
    end

    def update
        @user = User.find(params[:id])
        @user.update(params.permit(:username, :password))
        if @user.valid?
            render json: @user
        else
            render json: {errors: @user.errors.full_messages}
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end

end
