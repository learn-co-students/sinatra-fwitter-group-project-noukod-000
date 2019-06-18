require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "fwitter_secret"

    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb "/index".to_sym
  end
end
