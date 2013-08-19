get '/' do
	erb :index
end

get '/:username' do
  @user = TwitterUser.find_by_name(params[:username])
  if @user.tweets_stale?
    @user.fetch_tweets!
  end
  @tweets = @user.tweets
  erb :list
end


post '/user_find' do
  @user = TwitterUser.find_by_name(params[:username]) rescue nil
  @user = TwitterUser.create({name: params[:username]}) unless @user
  if @user.tweets.empty?
    @user.fetch_tweets!
  end
  redirect "/#{@user.name}"
end
