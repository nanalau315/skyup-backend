class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :post_id, :comment, :author
  
  belongs_to :user
  belongs_to :post
end
