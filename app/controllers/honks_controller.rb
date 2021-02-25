class HonksController < ApplicationController

    def create
        @honk = Honk.create(user_id: params[:user_id], post_id: params[:post_id])
        render json: @honk, except: [:created_at, :updated_at]
    end

    def destroy
        @honk = Honk.find(params[:id])
        @honk.destroy
    end

end
