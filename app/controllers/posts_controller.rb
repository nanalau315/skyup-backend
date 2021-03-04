class PostsController < ApplicationController

    def index
        @posts = Post.all
        render json: @posts
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    def create
        @post = Post.create!(user_id: params[:user_id], content: params[:content])
            if params[:post_image] != "null"
                if @post.post_image.errors
                    render json: {errors: @user.errors.full_messages}
                else
                    @post.post_image.attach(params[:post_image])
                end
            end
        render json: @post
    end

    def update
        @post = Post.find(params[:id])
        @post.update(content: params[:content])
        render json: @post
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    end

end
