
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
    erb :'/users/create_user'
  end

  post '/signup' do
    redirect to '/'
  end

  get '/login' do
    erb :'/users/login'
  end

  get '/tweets' do
    if Helpers.is_logged_in?(session)
      @tweets = Tweet.all
      erb :'/tweets/tweets'
    else
      redirect to 'users/login'
    end
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    
    if @tweet.user == Helpers.current_user(session)
      erb :'/tweets/show_tweet'
    else
      redirect to 'users/login'
    end 
  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.find(params[:id])
    if @tweet.user == Helpers.current_user(session)
        erb :'/tweets/edit_tweet'
    else
      redirect to 'users/login'
    end 
  end

  patch '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    @tweet.update(params[:tweet])
    @tweet.save
    redirect "/tweets/#{@tweet.id}"

  end

  delete '/tweets/:id/delete' do 
    if Helpers.is_logged_in?(session)
      if @tweet.user == Helpers.current_user(session)
        @tweet = Tweet.find_by_id(params[:id])
        @tweet.delete
        redirect to '/tweets'
      else
        redirect to '/tweets'
      end
    else
      redirect to '/login'  
    end  
  end

  get '/logout' do
    if Helpers.is_logged_in?(session)
      session.clear
    else
      redirect to '/'  
    end  
    redirect to '/users/login'
  end
end
