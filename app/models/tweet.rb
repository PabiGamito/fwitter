class Tweet
	ALL_TWEETS = []
	attr_accessor :username, :tweet, :all_tweets
	def initialize(username, tweet)
		@username = username
		@tweet = tweet
		ALL_TWEETS << self #.push(self)
  end
	def self.all
		ALL_TWEETS
	end
	# Should initialize with content and a username
	# The tweet class keep track of all instances of tweets that get created
end

@all_tweets = Tweet.all
puts Tweet.all