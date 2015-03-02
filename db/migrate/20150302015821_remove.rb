class Remove < ActiveRecord::Migration
  def change
    remove_column :hashtags, :tweet_id
    remove_column :user_mentions, :tweet_id
  end
end
