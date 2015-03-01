class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.datetime :published_at
      t.string :content
      t.integer :favorite_count
      t.integer :retweet_count
      t.string :original_url
      t.boolean :reply

      t.timestamps null: false
    end
  end
end
