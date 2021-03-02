class FriendshipsController < ApplicationController

    # Friendship.create(follower_id: 2, followee_id: 1)
    def create
        @friendship = Friendship.create(params.permit(:follower_id, :followee_id))
        render json: @friendship, except: [:created_at, :updated_at]
    end

    def destroy
        @friendship = Friendship.find(params[:id])
        @friendship.destroy
    end
    
end
