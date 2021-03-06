class CommentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :user_id, :post_id, :comment, :author, :author_image_url, :created_time
  
  belongs_to :user
  belongs_to :post
  has_many :commentreports

  def author_image_url
    polymorphic_url(object.user.user_image) if object.user.user_image.attached?
  end

end
