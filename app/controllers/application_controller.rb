# TODO: use omniauth http://www.rubydoc.info/gems/omniauth/1.2.2

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
    if @username==nil
      erb :landing
    else
      @tweets = Tweet.all
      erb :index
    end
  end

  get '/results' do
  	erb :results
	end

  get '/welcome' do
    erb :welcome
  end

  # TODO: Make it so that when you load /user/username it shows all user tweets
  get '/user' do
    erb :user
  end


  post '/signup' do
    # TODO: Make it so that the welcome page says welcome User
    # TODO: Find a way to encrypt passwords use Bcrypt gem
    # TODO: Error when passwords do not match.
    @username=params[:username]
    @password=params[:pwd1]
    @confirm_password=params[:pwd2]
    @error=""

    puts "Test"

    if @password==@confirm_password

      if User.exists?(:username => @username)
        # TODO: Error message user exists
        erb :landing
      else
        @user = User.new({:username => params[:username], :password => params[:pwd1], :email => params[:email]})
        @user.save
        erb :welcome
      end
    else
      erb :landing
    end
  end
  
  post '/login' do
    # TODO use a gem for authentication
    @username=params[:username]
    @password=params[:password]
    if User.exists?(:username => @username)
      @tweets=Tweet.all
      @username=@username
      erb :index
    else
      erb :landing
    end
  end

  post '/new_tweet' do
    # TODO: Change to user ID and check. Doesn't work yet. LOOK UP how use a specific item from the array. --> Tweet.all[ID]
  	@tweet= Tweet.new({:user_id => params[:user_id], :tweet => params[:tweet]})
    @user_id.tweet_count+=1
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