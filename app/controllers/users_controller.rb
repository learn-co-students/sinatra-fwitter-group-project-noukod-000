class UsersController < ApplicationController

  get "/signup" do
    erb "/users/create_user".to_sym
  end

  post "/signup" do
    user = User.new(:email => params[:email],:username => params[:username],:password => params[:password])

    if user.save #verify whether the new user is create
      session[:user_id] = user.id
      redirect to "/tweets"
    else
      redirect to "/signup"
    end
end

  get "/login" do
    erb "/users/login".to_sym
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect to "/tweets"
     else
       redirect to "/login"
     end
  end

  get "/logout" do
    if Helpers.is_logged_in?(session)
      session.clear
      redirect to "/login"
    else
      session.clear
      redirect to "/"
    end
  end
end
