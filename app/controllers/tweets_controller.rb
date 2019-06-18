class TweetsController < ApplicationController
  get "/tweets" do
    @tweets = Tweet.all
    erb "/tweets/tweets".to_sym
  end

end
