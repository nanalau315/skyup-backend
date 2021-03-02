class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  
  has_many :posts
  has_many :honks
  has_many :comments
  has_many :followees
  has_many :followers
  # has_many :following_users
  # has_many :followed_users 
  # the above two get me the joiner table info, which is not what I want

end
