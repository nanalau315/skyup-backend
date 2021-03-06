class PostreportsController < ApplicationController

    def create
        @postreport = Postreport.create(user_id: params[:user_id], post_id: params[:post_id], reason: params[:reason])
        render json: @postreport, except: [:created_at, :updated_at]
    end

    def update
        @postreport = Postreport.find(params[:id])
        @postreport.update(params.permit(:reason))
        render json: @postreport
    end

    def destroy
        @postreport = Postreport.find(params[:id])
        @postreport.destroy
    end

end
