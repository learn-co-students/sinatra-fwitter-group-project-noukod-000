class UsersController < ApplicationController
  use Rack::Flash

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :"users/show"
  end

  get "/signup" do

    if Helpers.is_logged_in? session
      redirect '/tweets'
    else
      erb :"users/signup"
    end
  end

  post "/signup" do

    user = User.new params

    if user.save
      session[:user_id] = user.id
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

    user = User.find_by(username: params[:username]) unless params[:username].empty?

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/tweets"
    else

      redirect "/signup"
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
