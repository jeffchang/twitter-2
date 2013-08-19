class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def tweets_stale?
    if tweets.to_a.length > 1
      @total_time = 0
      tweets.each_cons(2) do |tweet1, tweet2|
        @total_time += tweet1.tweet_time - tweet2.tweet_time
      end
      average_time = @total_time / (tweets.to_a.length - 1)
      (Time.now - tweets.first.created_at) >= average_time
    elsif tweets.to_a.length == 1
      (Time.now - tweets.first.created_at) >= 100000
    else
      true
    end
  end

  def fetch_tweets!
    Tweet.destroy_all("twitter_user_id" => id)
    Twitter.user_timeline(name).each do |tweet|
      p tweet
      Tweet.create({content: tweet[:text], twitter_user: self, tweet_time: tweet[:created_at]})
    end
  end
end
