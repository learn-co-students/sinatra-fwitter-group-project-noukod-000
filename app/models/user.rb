class User < ActiveRecord::Base 
  has_secure_password
  attr_accessor :username, :email, :password 
  has_many :tweets
end