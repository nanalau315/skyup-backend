class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :honks, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :postreports, dependent: :destroy
    has_many :commentreports, dependent: :destroy
    has_many :followed_users, foreign_key: :follower_id, class_name: "Friendship", dependent: :destroy
    has_many :followees, through: :followed_users, dependent: :destroy
    has_many :following_users, foreign_key: :followee_id, class_name: "Friendship", dependent: :destroy
    has_many :followers, through: :following_users, dependent: :destroy

    has_secure_password
    has_one_attached :user_image

    validates :username, presence: true
    validates :username, length: { in: 1..10 }
    validates :username, uniqueness: true
    validates :password, presence: true
    validates :password, length: { in: 4..10 }

    validate :acceptable_image
    
    def acceptable_image
        return unless user_image.attached?
      
        unless user_image.byte_size <= 5.megabyte
            user_image.errors.add("Image is too big")
        end
      
        acceptable_types = ["image/jpeg", "image/png", "image/jpg"]
        
        unless acceptable_types.include?(user_image.content_type)
            user_image.errors.add("Image must be a JPEG or PNG")
        end
    end

end
