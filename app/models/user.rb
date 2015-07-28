require 'gravtastic'
class User < ActiveRecord::Base

  has_many :tweets

  include Gravtastic
  gravtastic

  def add_tweet_count
    
  end

end