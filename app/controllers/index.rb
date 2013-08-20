get '/' do
	erb :index
end

post '/refresh' do
  @user = TwitterUser.find_by_name(params[:username])
  @user.fetch_tweets!
  @tweets = @user.tweets
  erb :list
end

get '/user_find' do
  @user = TwitterUser.find_by_name(params[:username]) rescue nil
  @user = TwitterUser.create({name: params[:username]}) unless @user
  if @user.tweets.empty? || @user.tweets_stale?
    @username = params[:username]
    erb :waiting
  else
    @tweets = @user.tweets
    erb :list
  end
end
