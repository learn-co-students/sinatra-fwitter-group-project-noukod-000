class TweetsController < ApplicationController
  get "/tweets" do
    if !Helpers.is_logged_in?(session)
      redirect to "/login"
    else
    @tweets = Tweet.all
    erb "/tweets/tweets".to_sym
  end
  end

end
