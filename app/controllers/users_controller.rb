require 'sinatra/base'
require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

        get '/user/:slug' do
          @user = User.find_by_slug(params[:slug])
          erb :'home'
        end

        get '/signup' do
          if Helpers.is_logged_in? session
            redirect '/home'
          else
            erb :'users/register'
          end
        end

      post '/signup' do
        user = User.find_by(email: params[:email]) unless params[:email].empty?
        if user
          flash[:error] = 'this email exist already. <br> go to the login page to sign in'
          redirect '/signup'
        else
          user = User.new params

          if user.save
            session[:user_id] = user.id
            redirect '/'
          else
            redirect '/signup'
          end
        end
      end
      
end