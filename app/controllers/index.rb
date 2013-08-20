get '/' do
	erb :index
end

post '/refresh' do
  @user = TwitterUser.find(params[:user_id])
  @user.fetch_tweets!
  erb :list
end

post '/user_find' do
  @user = TwitterUser.find_by_name(params[:username]) rescue nil
  @user = TwitterUser.create({name: params[:username]}) unless @user
  if @user.tweets.empty? || @user.tweets_stale?
    erb :waiting
  else
    @tweets = @user.tweets
    erb :list
  end
end
