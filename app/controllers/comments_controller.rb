class CommentsController < ApplicationController

    def create
        @comment = Comment.create(user_id: params[:user_id], post_id: params[:post_id], comment: params[:comment])
        render json: @comment
    end
    
    def update
        @comment = Comment.find(params[:id])
        @comment.update(params.permit(:comment))
        render json: @comment
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
    end

end
