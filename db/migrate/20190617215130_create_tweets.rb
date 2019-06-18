class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |el|
      el.belongs_to :user ,index: true
      el.string :content
    end
  end
end
