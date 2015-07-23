require_relative "../../config/environment"
require_relative "../models/tweet.rb"
require_relative "../models/user.rb"
class ApplicationController < Sinatra::Base
  
	configure do
		set :views, "app/views"
		set :public_dir, "public"
		set :models, "/app/models"
	end
	
  get "/" do
    # TODO: Check if user is connected and if do redirect to :index

		erb :landing
  end

  get "/home" do
    @tweets = Tweet.all

    erb :index
  end

  get '/results' do
  	erb :results
	end

  # TODO: Make it so that when you load /user/username it shows all user tweets
  get '/user' do
    erb :user
  end

  post '/signup' do

  end
  
  post '/login' do
    # if user credentials are correct
    erb :index
    # else error message
    erb :login_error
  end

  post '/new_tweet' do
  	@tweet= Tweet.new({:username => params[:username], :tweet => params[:tweet]})
    @tweet.save

    @tweets = Tweet.all

  # 	Tweet.all.each do |tweet_object|
		# 	@tweets.push("#{tweet_object.username.upcase}: #{tweet_object.tweet}")
		# end

		# def get_tweet()
		# 	return "@tweets[0]"
		# end

  	erb :index
  end

  
end