class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :posts
  
  has_many :posts
  has_many :likes

  # def posts
  #   self.object.posts.order(:id).map do |post|
  #     {id: post.id, user_id: post.user_id, content: post.content}
  #   end
  end
end
