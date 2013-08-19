class AddTweetTime < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_time, :datetime
  end
end
