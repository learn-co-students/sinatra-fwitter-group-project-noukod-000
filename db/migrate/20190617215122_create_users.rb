class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |el|
      el.string :username
      el.string :email
      el.string :password_digest
    end
  end
end
