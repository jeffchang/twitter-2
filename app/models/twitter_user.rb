class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def fetch_tweets!
    Twitter.user_timeline(name).each do |tweet|
      Tweet.create({content: tweet[:text], twitter_user: self})
    end
  end
end
