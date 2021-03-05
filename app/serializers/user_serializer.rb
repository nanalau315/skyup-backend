class UserSerializer < ActiveModel::Serializer
  # the following line is super important for the image to have a working url
  include Rails.application.routes.url_helpers
  
  attributes :id, :username, :image_url
  
  has_many :posts
  has_many :honks
  has_many :comments
  has_many :followees
  has_many :followers
  has_many :following_users
  has_many :followed_users

  def image_url
    polymorphic_url(object.user_image) if object.user_image.attached?
  end

end
