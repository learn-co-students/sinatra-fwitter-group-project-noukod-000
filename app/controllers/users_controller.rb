class UsersController < ApplicationController

  get "/signup" do
    if !logged_in?
      erb :"users/create_user"
    else
      redirect to '/tweets'
    end
  end

    post '/signup' do
      if params[:username] == "" || params[:password] == "" || params[:email] == ""
       redirect :"/signup"
    else
    #   user = User.create(params[:user])
    #   redirect 'users/login'
    # end
    @user = User.new(:username => params[:username], :email => params[:email])
        user.authenticate(params[:password])
        @user.save
      session[:user_id] = user.id
     redirect "/tweets"

   end
  end

  get '/users/:slug' do
    user = User.find_by_slug(session[:slug])
    if logged_in?
			erb :'/users/show'
		else
			redirect "/login"
		end

  #    @user = User.find(session[:user_id])
  #   erb :'/users/show'
   end

  get "/login" do
    if !logged_in?
    erb :'/users/login'
  else
    redirect to '/tweets'
  end

  user = User.find_by(:username => params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/tweets"
  else
    redirect "/signup"
  end
end

  post '/login' do
    user = User.find_by(:username => params[:username])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
       redirect "/tweets"
     else
       redirect "/login"
     end
   end
 end

 get "/logout" do
   if logged_in?
   session.destroy
   redirect "/login"
 else
   redirect '/'
  end
end
end
