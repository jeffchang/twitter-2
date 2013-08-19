get '/' do
	erb :index
end

get '/:username' do
  
  if @user.tweets.empty?


    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)

  erb :list
end


post '/user_find' do
  @user = TwitterUser.find_by_username(params[:username])

  redirect "/#{@user.username}"
end
