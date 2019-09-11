class CreateTweet < ActiveRecord::Migration
  def change
    create_table :tweets do |a|
      a.string :content 
      a.integer :user_id
    end
  end
end

