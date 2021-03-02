class UsersController < ApplicationController
    before_action :authenticate, only: [:update]
    # need to add :show back for auth to work

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

    def index
        @users = User.all
        render json: @users
    end

    def show
        # uncomment the next line for real auth
        # render json: @current_user
        render json: User.find(2)
    end

    def update
        # @user = User.find(params[:id])
        # @user.update(params.permit(:username, :password))
        # if @user.valid?
        #     render json: @user
        # else
        #     render json: {errors: @user.errors.full_messages}
        # end
        @current_user.update(password: params[:password])
        render json: @current_user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end

end
