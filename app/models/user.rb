# class User < ActiveRecord::Base
#     validates_presence_of :name, :email, :password
#   end

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  
  has_many :tweets

  def self.find_by_slug(slug)
    self.all.find{ |user| user.slug == slug }
  end
  def slug
    self.name.gsub(" ", "-").downcase
  end
end
