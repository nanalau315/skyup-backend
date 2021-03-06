class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    has_many :commentreports, dependent: :destroy

    def author
        self.user.username
    end

    def created_time
        if (Time.now.to_i - self.created_at.to_i) <= 60
            "few seconds"
        elsif (Time.now.to_i - self.created_at.to_i) <= 3600
            "1 hour"
        elsif (Time.now.to_i - self.created_at.to_i) <= 7200
            "2 hours"
        elsif (Time.now.to_i - self.created_at.to_i) <= 10800
            "3 hours"
        elsif (Time.now.to_i - self.created_at.to_i) <= 14400
            "4 hours"
        elsif (Time.now.to_i - self.created_at.to_i) <= 18000
            "5 hours"
        elsif (Time.now.to_i - self.created_at.to_i) <= 21600
            "6 hours"
        elsif (Time.now.to_i - self.created_at.to_i) <= 25200
            "7 hours"
        elsif (Time.now.to_i - self.created_at.to_i) <= 28800
            "8 hours"
        elsif (Time.now.to_i - self.created_at.to_i) <= 32400
            "9 hours"
        elsif (Time.now.to_i - self.created_at.to_i) <= 36000
            "10 hours"
        elsif (Time.now.to_i - self.created_at.to_i) <= 39600
            "11 hours"
        elsif (Time.now.to_i - self.created_at.to_i) <= 43200
            "12 hours"
        elsif (Time.now.to_i - self.created_at.to_i) < 86400
            "Half a day"
        elsif (Time.now.to_i - self.created_at.to_i) < 172800
            "1 day"
        elsif (Time.now.to_i - self.created_at.to_i) < 259200
            "2 days"
        elsif (Time.now.to_i - self.created_at.to_i) < 345600
            "3 days"
        elsif (Time.now.to_i - self.created_at.to_i) < 432000
            "4 days"
        elsif (Time.now.to_i - self.created_at.to_i) < 518400
            "5 days"
        elsif (Time.now.to_i - self.created_at.to_i) < 604800
            "6 days"
        elsif (Time.now.to_i - self.created_at.to_i) < 691200
            "a week"
        else 
            self.created_at.strftime("%Y-%m-%d")
        end
    end
end
