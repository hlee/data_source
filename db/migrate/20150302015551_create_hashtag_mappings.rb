class CreateHashtagMappings < ActiveRecord::Migration
  def change
    create_table :hashtag_mappings do |t|
      t.references :hashtag, index: true
      t.references :tweet, index: true

      t.timestamps null: false
    end
    add_foreign_key :hashtag_mappings, :hashtags
    add_foreign_key :hashtag_mappings, :tweets
  end
end
