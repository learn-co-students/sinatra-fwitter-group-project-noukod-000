class UsersController < ApplicationController

  get "/users/:id" do
    user=User.find_by_id(@params[:id])
    binding.pry
    erb :"users/show"
  end

end
