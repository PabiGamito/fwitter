require_relative "../../config/environment"
require_relative "../models/tweet.rb"
class ApplicationController < Sinatra::Base
  
	configure do
		set :views, "app/views"
		set :public_dir, "public"
		set :models, "/app/models"
	end
	
  get "/" do
		erb :tweets
  end

  get '/results' do
  	erb :results
	end

  post '/' do
  	@tweet= Tweet.new(params[:username], params[:fweet])
  	@time= Time.new
  	@tweets = []

  	Tweet.all.each do |tweet_object|
			@tweets.push("#{tweet_object.username} #{tweet_object.tweet}")
		end

  	erb :results
  end

  
end