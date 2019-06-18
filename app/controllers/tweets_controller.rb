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
        erb "/tweets/new".to_sym
      else
        redirect to "/login"
      end
    end

    post "/tweets" do
      if Helpers.is_logged_in?(session)
          tweet = Helpers.current_user(session).tweets.build(content: params[:content])
          if tweet.save
              redirect to "/tweets/#{tweet.id}"
          else
            redirect to "/tweets/new"
          end
      else
          redirect to '/login'
      end
    end

    get "/tweets/new" do
      if Helpers.is_logged_in?(session)
        @user = User.find_by(:id => session[:user_id])
        erb "/tweets/new".to_sym
      else
        redirect to "/login"
      end
    end

    post "/tweets" do
      if Helpers.is_logged_in?(session)
          tweet = Helpers.current_user(session).tweets.build(content: params[:content])
          if tweet.save
              redirect to "/tweets/#{tweet.id}"
          else
            redirect to "/tweets/new"
          end
      else
          redirect to '/login'
      end
    end

    get "/tweets/new" do
      if Helpers.is_logged_in?(session)
        @user = User.find_by(:id => session[:user_id])
        erb "/tweets/new".to_sym
      else
        redirect to "/login"
      end
    end

    post "/tweets" do
      if Helpers.is_logged_in?(session)
          tweet = Helpers.current_user(session).tweets.build(content: params[:content])
          if tweet.save
              redirect to "/tweets/#{tweet.id}"
          else
            redirect to "/tweets/new"
          end
      else
          redirect to '/login'
      end
    end

    get "/tweets/:id" do
      if Helpers.is_logged_in?(session)
        @tweet = Tweet.find_by_id(params[:id])
        erb :'tweets/show_tweet'
      else
        redirect to '/login'
      end
    end

end
