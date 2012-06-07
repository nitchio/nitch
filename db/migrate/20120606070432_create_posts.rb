class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :slug
      t.string :key
      t.string :title
      t.text :body
      t.string :link_url
      t.integer :type
      t.integer :user_id
      t.integer :nitch_id
      t.integer :archive_id

  
      t.timestamps
    end
  
    add_index :posts, :slug
    add_index :posts, :key
    add_index :posts, :type
    add_index :posts, :user_id
    add_index :posts, :nitch_id
    add_index :posts, :archive_id
  end
end
