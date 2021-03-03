class Friendship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followee, class_name: "User"

    validates :follower, uniqueness: {scope: :followee}
    validates :followee, uniqueness: {scope: :follower}

    # Followee is who you are following
    # Follower are those following you

    def follower_username
        self.following_user.username
    end

    # def following_username
    #     self.followees.username
    # end

end
