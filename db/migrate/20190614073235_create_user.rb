class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |a|
      a.string :username
      a.string :email
      a.string :password_digest
    end
  end
end
