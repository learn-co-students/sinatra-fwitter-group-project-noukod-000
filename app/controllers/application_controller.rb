
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    redirect to '/'
  end

  get '/tweets' do
    if Helpers.is_logged_in?(session)
      @tweets = Tweet.all
      erb :'tweets/tweets'
    else
      redirect to 'users/login'
    end
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    
    if @tweet.user == Helpers.current_user(session)
      erb :'tweets/show_tweet'
    else
      redirect to 'users/login'
    end 
  end
  
  get '/logout' do
    if Helper.is_logged_in?(session)
      session.clear
    else
      redirect to '/'  
    end  
    redirect to 'users/login'
  end

  get '/tweets' do
    @tweets = Tweet.all
    erb :'tweets/tweets'
  end
end
