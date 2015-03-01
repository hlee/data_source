json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :published_at, :content, :favorite_count, :retweet_count, :original_url, :reply
  json.url tweet_url(tweet, format: :json)
end
