class Tweet < ActiveRecord::Base
  has_many :hashtag_mappings, -> {uniq}
  has_many :hashtags, -> {uniq}, through: :hashtag_mappings
  has_many :user_mention_mappings, -> {uniq}
  has_many :user_mentions, -> {uniq}, through: :user_mention_mappings

  @client = Twitter::REST::Client.new do |config|
  config.consumer_key = ''
  config.consumer_secret = ''
  config.oauth_token = ''
  config.oauth_token_secret = ''
  end


  def self.grab

    tweets =  @client.user_timeline('barackobama')#, max_id: '375658933253197824')
    Tweet.save_tweets(tweets)
    #tweets = Tweet.last(20)
    while true
      #debugger
      tweets = @client.user_timeline('barackobama', max_id: tweets.last.id.to_s, count: 200)
      Tweet.save_tweets(tweets)
      break if tweets.empty?
    end
  end

  def self.save_tweets(tweets)
    tweets.each do |tweet|
      tw = Tweet.find_or_create_by(origin_id: tweet.id)
      tw.update(
        published_at: tweet.created_at,
        content: tweet.full_text,
        favorite_count: tweet.favorite_count,
        retweet_count: tweet.retweet_count,
        original_url: tweet.url,
        reply: tweet.reply?
      )
      tweet.urls.each do |ul|
        ContainUrl.find_or_create_by(url: ul.attrs[:url], tweet: tw)
      end

      tweet.hashtags.each do |ht|
        hashtag = Hashtag.find_or_create_by(content: ht.attrs[:text])
        tw.hashtags << hashtag
      end

      tweet.user_mentions.each do |um|
        user_mention = UserMention.find_or_create_by(original_id: um.attrs[:id_str])
        user_mention.update(
          screen_name: um.attrs[:screen_name],
          name: um.attrs[:name]
        )
        tw.user_mentions << user_mention
      end
    end
  end
end
