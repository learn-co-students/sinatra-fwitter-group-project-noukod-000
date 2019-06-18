class TweetsController < ApplicationController

  get '/tweets' do
    if session[:id].nil?
      redirect '/login'
    end

    @tweets = Tweet.all
    @user = User.find session[:id]

    erb :'tweets/tweets'
  end

  get '/tweets/new' do
    if is_logged_in?
      erb :'tweets/new'
    else
      redirect '/login'
    end
  end

  post '/tweets' do
    @tweet = Tweet.create content: params[:content], user_id: session[:id]

    if @tweet.valid?
      redirect '/tweets'
    else
      redirect '/tweets/new'
    end
  end

  get '/tweets/:id' do
    @tweet = Tweet.find params[:id]
    if is_logged_in?
      erb :'tweets/show_tweet'
    else
      redirect '/login'
    end
  end

  get '/tweets/:id/edit' do
    if is_logged_in?
      @tweet = current_user.tweets.find params[:id]
      erb :'tweets/edit_tweet'
    else
      redirect '/login'
    end
  end

  patch '/tweets/:id' do
    if is_logged_in?

      @tweet = current_user.tweets.find params[:id]
      @tweet.update(content: params[:content])
      if @tweet.valid?
        redirect "/tweets/#{@tweet.id}"
      else
        redirect "/tweets/#{@tweet.id}/edit"
      end
    else
      redirect '/login'
    end
  end

  delete '/tweets/:id' do
    if is_logged_in?
      @tweet = Tweet.find params[:id]

      if current_user.tweets.include?(@tweet)
        @tweet.delete
      end
      redirect '/tweets'
    else
      redirect '/login'
    end
  end

end

 #  get '/tweets' do
 #   if logged_in?
 #     @tweets = Tweet.all
 #     erb :'tweets/tweets'
 #   else
 #     redirect to '/login'
 #   end
 # end
 #
 # get '/tweets/new' do
 #   if logged_in?
 #     erb :'tweets/create_tweet'
 #   else
 #     redirect to '/login'
 #   end
 # end
 #
 # post '/tweets' do
 #   if logged_in?
 #     if params[:content] == ""
 #       redirect to "/tweets/new"
 #     else
 #       @tweet = current_user.tweets.build(content: params[:content])
 #       if @tweet.save
 #         redirect to "/tweets/#{@tweet.id}"
 #       else
 #         redirect to "/tweets/new"
 #       end
 #     end
 #   else
 #     redirect to '/login'
 #   end
 # end
 #
 # get '/tweets/:id' do
 #   if logged_in?
 #     @tweet = Tweet.find_by_id(params[:id])
 #     erb :'tweets/show_tweet'
 #   else
 #     redirect to '/login'
 #   end
 # end
 #
 # get '/tweets/:id/edit' do
 #   if logged_in?
 #     @tweet = Tweet.find_by_id(params[:id])
 #     if @tweet && @tweet.user == current_user
 #       erb :'tweets/edit_tweet'
 #     else
 #       redirect to '/tweets'
 #     end
 #   else
 #     redirect to '/login'
 #   end
 # end
 #
 # patch '/tweets/:id' do
 #   if logged_in?
 #     if params[:content] == ""
 #       redirect to "/tweets/#{params[:id]}/edit"
 #     else
 #       @tweet = Tweet.find_by_id(params[:id])
 #       if @tweet && @tweet.user == current_user
 #         if @tweet.update(content: params[:content])
 #           redirect to "/tweets/#{@tweet.id}"
 #         else
 #           redirect to "/tweets/#{@tweet.id}/edit"
 #         end
 #       else
 #         redirect to '/tweets'
 #       end
 #     end
 #   else
 #     redirect to '/login'
 #   end
 # end
 #
 # delete '/tweets/:id/delete' do
 #   if logged_in?
 #     @tweet = Tweet.find_by_id(params[:id])
 #     if @tweet && @tweet.user == current_user
 #       @tweet.delete
 #     end
 #     redirect to '/tweets'
 #   else
 #     redirect to '/login'
 #   end
 # end
# end
