require_relative "../models/tweet.rb"

class User
  attr_accessor :username, :password, :email
  def initialize(username, password, email)
    @username=username
    @password=password
    @email=email
  end
  def add_tweet(tweet)
    
  end

end