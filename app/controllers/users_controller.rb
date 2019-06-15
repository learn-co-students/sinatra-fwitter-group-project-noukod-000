class UsersController < ApplicationController


  get '/users/create_user' do
    @user = User.find_by(params[:username])
    erb :"users/show"
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :"users/show"
  end

  get "/signup" do
    # binding.pry
    if Helpers.is_logged_in? session
      redirect '/tweets'
    else
      erb :"users/create_user"
    end
  end

  post "/signup" do
    # binding.pry

    @user = User.new username: params[:username], email: params[:email], password: params[:password]

    #binding.pry

    if @user.save
      session[:user_id] = @user.id
      redirect "/tweets"
    else
      redirect "/signup"
    end
  end

  get '/login' do
    if Helpers.is_logged_in? session
      redirect '/tweets'
    else
      erb :"users/login"
    end
  end

  post '/login' do
    # binding.pry
    user = User.find_by(username: params[:username]) unless params[:username].empty?

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/tweets"
    else
      redirect "users/login"
    end
  end

  get '/logout' do
     if Helpers.is_logged_in? session
       session.clear
       redirect to '/login'
     else
       redirect to '/'
     end
   end
end
