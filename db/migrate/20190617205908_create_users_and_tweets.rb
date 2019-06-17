class CreateUsersAndTweets < ActiveRecord::Migration
  def change
    create_table :users do |el|
      el.string :username
      el.string :email
      el.string :password
    end

    create_table :tweets do |el|
      el.belongs_to :user ,index: true
      el.string :content
    end
  end
end
