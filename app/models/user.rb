class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :honks, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :followed_users, foreign_key: :follower_id, class_name: "Friendship", dependent: :destroy
    has_many :followees, through: :followed_users, dependent: :destroy
    has_many :following_users, foreign_key: :followee_id, class_name: "Friendship", dependent: :destroy
    has_many :followers, through: :following_users, dependent: :destroy

    has_secure_password

    validates :username, presence: true
    validates :username, length: { in: 1..10 }
    validates :username, uniqueness: true
    validates :password, presence: true
    validates :password, length: { in: 4..10 }

end
