class CommentreportsController < ApplicationController

    def create
        @commentreport = Commentreport.create(user_id: params[:user_id], comment_id: params[:comment_id], reason: params[:reason])
        render json: @commentreport, except: [:created_at, :updated_at]
    end

    def update
        @commentreport = Commentreport.find(params[:id])
        @commentreport.update(params.permit(:reason))
        render json: @commentreport
    end

    def destroy
        @commentreport = Commentreport.find(params[:id])
        @commentreport.destroy
    end

end
