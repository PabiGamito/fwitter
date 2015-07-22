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
		erb :tweets
  end

 #  get '/results' do
 #  	erb :results
	# end

  post '/results' do
  	@tweet= Tweet.new(params[:username], params[:fweet])
  	@time= Time.new
  	@tweets = []

    @all_tweets=Tweet.all

  # 	Tweet.all.each do |tweet_object|
		# 	@tweets.push("#{tweet_object.username.upcase}: #{tweet_object.tweet}")
		# end

		# def get_tweet()
		# 	return "@tweets[0]"
		# end

  	erb :results
  end

  
end