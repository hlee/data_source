class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :content
      t.references :tweet, index: true

      t.timestamps null: false
    end
    add_foreign_key :hashtags, :tweets
  end
end
