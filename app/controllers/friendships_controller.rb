class FriendshipsController < ApplicationController

    # Friendship.create(follower_id: 2, followee_id: 1)
    def create
        @friendship = Friendship.create(params.permit(:follower_id, :followee_id))
        if @friendship.valid?
            render json: @friendship, except: [:created_at, :updated_at]
        else
            render json: { errors: ["You've followed this user already!"]}
        end
    end

    def destroy
        @friendship = Friendship.find(params[:id])
        @friendship.destroy
    end
    
end
