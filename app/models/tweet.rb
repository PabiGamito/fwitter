@array=[]
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

tweet1=Tweet.new("Ian", "I am too blessed to be stressing")
tweet2=Tweet.new("Donald", "Time to make the right move #ChangeAmerica")

@all_tweets = Tweet.all
puts Tweet.all