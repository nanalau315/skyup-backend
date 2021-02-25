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
        @post = Post.create(user_id: params[:user_id], content: params[:content])
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
