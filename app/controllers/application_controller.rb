require_relative "../../config/environment"
require_relative "../models/tweet.rb"
class ApplicationController < Sinatra::Base
  
	configure do
		set :views, "app/views"
		set :public, "public"
		set :models, "/app/models"
	end
	
  get "/" do
		#make 3 new tweets
		#save all tweets in one instance variable as an array
		#pass that instance variable into the view useing ERB
		@tweet1=Tweet.new("Chloe","Hello owner of this computer!")
		@tweet2=Tweet.new("Donald Trump","I can't control my hair, but I can control a country! #Trump2016")
		@tweet3=Tweet.new("Chloe","Sorry if you are a republican...")
		@tweets=[]
		
		Tweet.all.each do |tweet_object|
			@tweets.push("#{tweet_object.username} says: #{tweet_object.tweet}")
		end
		
		erb :tweets
  end
  
end