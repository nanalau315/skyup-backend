class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id
  
  belongs_to :user
  has_many :honks
  has_many :comments

  # def comments
  #   self.object.comments.order(:id).map do |comment|
  #     {id: comment.id, user_id: comment.user_id, post_id: comment.post_id, comment: comment.comment}
  #   end
  # end

end
