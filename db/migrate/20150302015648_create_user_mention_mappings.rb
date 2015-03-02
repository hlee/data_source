class CreateUserMentionMappings < ActiveRecord::Migration
  def change
    create_table :user_mention_mappings do |t|
      t.references :user_mention, index: true
      t.references :tweet, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_mention_mappings, :user_mentions
    add_foreign_key :user_mention_mappings, :tweets
  end
end
