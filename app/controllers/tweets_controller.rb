class TweetsController < ApplicationController
  get "/tweets" do
    if !Helpers.is_logged_in?(session)
      redirect to "/login"
    else
    @tweets = Tweet.all
    erb "/tweets/tweets".to_sym
  end
  end

  get "/tweets/new" do
    if Helpers.is_logged_in?(session)
      @user = User.find_by(:id => session[:user_id])
      erb "/tweets/new"
    end
  end

  post "/tweets" do
    if Helpers.is_logged_in?(session)
      @tweet = Tweet.create(params [:content])
    end
  end
end
