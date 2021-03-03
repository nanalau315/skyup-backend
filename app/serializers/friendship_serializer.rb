class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :follower_id, :followee_id
  # , :follower_username, :following_username
end
