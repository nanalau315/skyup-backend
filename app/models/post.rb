class Post < ApplicationRecord
    belongs_to :user
    has_many :honks
    has_many :comments

    def author
        self.user.username
    end
end
