class Tweet < ActiveRecord::Base 
  attr_accessor :content 
  belongs_to :user 
end