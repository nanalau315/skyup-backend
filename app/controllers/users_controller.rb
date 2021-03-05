class UsersController < ApplicationController
    before_action :authenticate, only: [:show, :update]
    # need to add :show back for auth to work

    def signup
        @user = User.create(username: params[:username], password: params[:password])
        if @user.valid?
            token = JWT.encode({user_id: @user.id}, "5KyuPy0uR5ky6yn4n414u", "HS256")
            if params[:user_image] != "null"
                @user.user_image.attach(params[:user_image])
            end
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
        render json: @current_user

    end

    def find_user
        @user = User.find(params[:id])
            render json: @user
    end

    def update
        @current_user.update(username: params[:username], password: params[:password])
            if params[:user_image] != "null"
                if @current_user.user_image.attached?
                    @current_user.user_image.purge
                    @current_user.user_image.attach(params[:user_image])
                else
                    @current_user.user_image.attach(params[:user_image])
                end 
            end
        render json: @current_user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end

end
