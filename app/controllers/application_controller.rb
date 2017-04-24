require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

<<<<<<< HEAD
  get '/' do
    erb :index
=======
  get '/signup' do
>>>>>>> bb0f5b0445a5ff8d3b80f9ae452361827fd19f87
  end

end
