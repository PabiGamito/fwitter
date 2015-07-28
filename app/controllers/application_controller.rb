# TODO: use omniauth http://www.rubydoc.info/gems/omniauth/1.2.2

require_relative "../../config/environment"
require_relative "../models/tweet.rb"
require_relative "../models/user.rb"

class ApplicationController < Sinatra::Base
  
	configure do
		set :views, "app/views"
		set :public_dir, "public"
		set :models, "/app/models"
    enable :sessions
    # Sets password to read the cookies
    set :session_secret, "thebestpassword"
	end
	
  get "/" do
    # TODO: Check if user is connected and if do redirect to :index
    if session["user"]==nil
      erb :landing
    else
      @tweets=Tweet.all
		  @user_id=session["user"]
      erb :index
    end
  end


  get "/home" do
    # session["user"] ||= nil
    @username=session["user"]
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
    @user=User.find_by({:username => @username})
    if User.exists?(:username => @username)
      @tweets=Tweet.all
      # TODO get user id out of this.
      session["user"]=@user.id
      @user_id=session["user"]
      erb :index
    else
      erb :landing
    end
  end

  get '/logout' do
    session["user"] = nil
    redirect '/'
  end

  post '/new-tweet' do
    # TODO: Change to user ID and check. Doesn't work yet. LOOK UP how use a specific item from the array. --> Tweet.all[ID]
    puts "Trying to Create New Tweet"
    if session["user"]!=nil
    @tweet= Tweet.new({:user_id => params[:user_id], :tweet => params[:tweet]})
    # @user.add_tweet_count
    @tweet.save

    @tweets = Tweet.all

  else 
    redirect '/'

  end

  # 	Tweet.all.each do |tweet_object|
		# 	@tweets.push("#{tweet_object.username.upcase}: #{tweet_object.tweet}")
		# end

		# def get_tweet()
		# 	return "@tweets[0]"
		# end

  	erb :index
  end

  
end