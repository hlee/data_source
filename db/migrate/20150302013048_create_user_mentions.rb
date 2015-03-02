class CreateUserMentions < ActiveRecord::Migration
  def change
    create_table :user_mentions do |t|
      t.string :screen_name
      t.string :name
      t.string :original_id
      t.references :tweet, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_mentions, :tweets
  end
end
