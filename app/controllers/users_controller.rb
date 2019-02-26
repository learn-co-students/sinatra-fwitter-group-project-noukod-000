class UsersController < ApplicationController
  get "/signup" do
      erb :"users/create_user"
    end

    post '/signup' do
      if params[:username] == "" || params[:password] == "" || params[:email] == ""
       redirect :"/signup"
    else
      user = User.create(params[:user])
      redirect 'users/login'
    end
  end
end
