class Tweet < ActiveRecord::Base
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key = 'key'
    config.consumer_secret = 'secret'
    config.oauth_token = 'token'
    config.oauth_token_secret = 'secret'
  end


  def self.grab

    #tweets =  @client.user_timeline('barackobama')
    #Tweet.save_tweets(tweets)
    tweets = Tweet.last(2)
    while true
      #debugger
      tweets = @client.user_timeline('barackobama', max_id: tweets.last.origin_id.to_s, count: 200)
      Tweet.save_tweets(tweets)
      sum += tweets.count
      break if tweets.empty?
    end
  end

  def self.save_tweets(tweets)
    tweets.each do |tweet|
      Tweet.find_or_create_by(origin_id: tweet.id).update(
        published_at: tweet.created_at,
        content: tweet.full_text,
        favorite_count: tweet.favorite_count,
        retweet_count: tweet.retweet_count,
        original_url: tweet.url,
        reply: tweet.reply?
      )
    end
  end
end
