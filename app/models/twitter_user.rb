class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def tweets_stale?
    one_tweet = Tweet.find_by_twitter_user_id(id) rescue nil
    if one_tweet
      (Time.now - one_tweet.created_at) >= 900
    else
      true
    end
  end

  def fetch_tweets!
    Tweet.destroy_all("twitter_user_id" => id)
    Twitter.user_timeline(name).each do |tweet|
      Tweet.create({content: tweet[:text], twitter_user: self})
    end
  end
end
