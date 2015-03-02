class CreateContainUrls < ActiveRecord::Migration
  def change
    create_table :contain_urls do |t|
      t.string :url
      t.references :tweet, index: true

      t.timestamps null: false
    end
    add_foreign_key :contain_urls, :tweets
  end
end
