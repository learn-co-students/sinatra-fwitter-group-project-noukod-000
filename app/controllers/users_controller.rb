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

  get '/users/:slug' do
    if logged_in?
			erb :'/users/show'
		else
			redirect "/login"
		end

     @user = User.find(session[:user_id])
    erb :'/users/show'
  end

end
