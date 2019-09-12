class User < ActiveRecord::Base
    has_many :tweets
    has_secure_password
    validates :username, presence: true
    validates :email, presence: true
    
    def self.find_by_slug(slug)
        self.all.find do |user| 
            user.slug == slug 
        end
    end

    def slug
        self.username.gsub(" ", "-").downcase
    end
end