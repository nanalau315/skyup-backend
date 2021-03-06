class PostSerializer < ActiveModel::Serializer
  # the following line is super important for the image to have a working url
  include Rails.application.routes.url_helpers
  
  attributes :id, :content, :user_id, :author, :created_time, :image_url
  
  belongs_to :user
  has_many :honks
  has_many :comments
  has_many :postreports
  
  def image_url
      polymorphic_url(object.post_image) if object.post_image.attached?
  end
    # def post_image
    #     if object.post_image.attached?
    #         { url: rails_blob_path(object.post_image, only_path: true)}
    #     end
    # end

    # def post_image
    #     rails_blob_path(object.post_image, only_path: true) if object.post_image.attached?
    # end

    #ArgumentError (Missing host to link to! Please provide the :host parameter, set default_url_options[:host], or set :only_path to true):


end
