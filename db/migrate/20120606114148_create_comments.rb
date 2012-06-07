class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.string :key
      t.string :ancestry
      t.integer :ancestry_depth, default: 0
      t.integer :user_id
      t.integer :post_id
      t.integer :archive_id

      t.timestamps
    end

    add_index :comments, :key
    add_index :comments, :ancestry
    add_index :comments, :user_id
    add_index :comments, :post_id
    add_index :comments, :archive_id
  end
end
