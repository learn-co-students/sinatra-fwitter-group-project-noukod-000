class UsersController < ApplicationController

    get "/signup" do
    end
    
    post "/signup" do
    end
    
     get "/login" do
       erb :login
    end
    
    post "/login" do
      user = User.find_by(username: params["username"], password: params["password"])
    if user
      session[:user_id] = user.id
      redirect to '/users/login'
    else
      erb :error
    end

    end
    
     get "/logout" do
       session.clear
       redirect to "/users/login"
    end
    
   # post "/signup" do
    #end
    
end
