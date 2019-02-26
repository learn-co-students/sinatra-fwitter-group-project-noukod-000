#class TweetsController < ApplicationController

#   get '/tweets' do
#     if !helpers.is_logged_in?(session)
#       redirect to '/login'
#     end
#     @tweets = Tweet.all
#     @user = Helpers.current_user(session)
#     erb :"/tweets/tweets"
#   end
#
#   get '/tweets/new' do
#     if !Helpers.is_logged_in?(session)
#       redirect to '/login'
#     end
#     erb :"/tweets/create_tweet"
#   end
#
#   post '/tweets' do
#     user = Helpers.current_user(session)
#     if params["content"].empty?
#       flash[:empty_tweet] = "Please enter content for your tweet"
#       redirect to '/tweets/new'
#     end
#     tweet = Tweet.create(:content => params["content"], :user_id => user.id)
#
#     redirect to '/tweets'
#   end
#
#   get '/tweets/:id' do
#     if !Helpers.is_logged_in?(session)
#       redirect to '/login'
#     end
#     @tweet = Tweet.find(params[:id])
#     erb :"tweets/show_tweet"
#   end
#
#   get '/tweets/:id/edit' do
#     if !Helpers.is_logged_in?(session)
#       redirect to '/login'
#     end
#     @tweet = Tweet.find(params[:id])
#     if Helpers.current_user(session).id != @tweet.user_id
#       flash[:wrong_user_edit] = "Sorry you can only edit your own tweets"
#       redirect to '/tweets'
#     end
#     erb :"tweets/edit_tweet"
#   end
#
#   patch '/tweets/:id' do
#     tweet = Tweet.find(params[:id])
#     if params["content"].empty?
#       flash[:empty_tweet] = "Please enter content for your tweet"
#       redirect to "/tweets/#{params[:id]}/edit"
#     end
#     tweet.update(:content => params["content"])
#     tweet.save
#
#     redirect to "/tweets/#{tweet.id}"
#   end
#
#   post '/tweets/:id/delete' do
#     if !Helpers.is_logged_in?(session)
#       redirect to '/login'
#     end
#     @tweet = Tweet.find(params[:id])
#     if Helpers.current_user(session).id != @tweet.user_id
#       flash[:wrong_user] = "Sorry you can only delete your own tweets"
#       redirect to '/tweets'
#     end
#     @tweet.delete
#     redirect to '/tweets'
#   end
#
#   get '/users/:slug' do
#     slug = params[:slug]
#     @user = User.find_by_slug(slug)
#     erb :"users/show"
#   end
#
#   get '/logout' do
#     if Helpers.is_logged_in?(session)
#       session.clear
#       #redirect to '/login'
#     else
#       redirect to '/'
#     end
#     redirect to '/login'
#   end
# end
#   get '/tweets' do
#     if logged_in?
#       @tweets =Tweet.all
#       erb :'tweets/tweets'
#     else
#       redirect to '/login'
#     end
#   end
#
#   get '/tweets/new' do
#     if logged_in?
#       erb :'tweets/new'
#     else
#       redirect to '/login'
#     end
#   end
#
#   get '/tweet/:id' do
#     if logged_in?
#       @tweets = Tweet.find(params[:id])
#       erb :'tweets/show_tweet'
#     else
#
#       redirect to '/login'
#     end
#   end
#
# get '/tweets/:id/edit' do
# if logged_in?
#   @tweet = Tweet.find(params[:id])
#      if @tweet && @tweet.user == current_user
#        erb :'tweets/edit_tweet'
#      else
#        redirect to "/tweets/#{@tweet.id}"
#      end
#    else
#      redirect to '/login'
#    end
#
# end
#
#
# post '/tweets' do
#     if logged_in?
#       if params[:content] == ""
#         redirect to "/tweets/new"
#       else
#         @tweet = current_user.tweets.build(content: params[:content])
#         if @tweet.save
#           redirect to "/tweets/#{@tweet.id}"
#         else
#           redirect to "/tweets/new"
#         end
#       end
#     else
#       redirect to '/login'
#     end
#   end
#
#   patch '/tweets/:id' do
#     if logged_in?
#       if params[:content] == ""
#         redirect to "/tweets/#{params[:id]}/edit"
#       else
#         @tweet = Tweet.find_by_id(params[:id])
#         if @tweet && @tweet.user == current_user
#           if @tweet.update(content: params[:content])
#             redirect to "/tweets/#{@tweet.id}"
#           else
#             redirect to "/tweets/#{@tweet.id}/edit"
#           end
#         else
#           redirect to '/tweets'
#         end
#       end
#     else
#       redirect to '/login'
#     end
#   end
#
#   delete '/tweets/:id' do
#     if logged_in?
#       @tweet = Tweet.find_by_id(params[:id])
#       if @tweet && @tweet.user == current_user
#         @tweet.delete
#       end
#       redirect to '/tweets'
#     else
#       redirect to '/login'
#     end
#   end
#end
