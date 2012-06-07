class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :title, :slug, :key
      t.text :body
      t.integer :user_id, :nitch_id

      t.timestamps
    end

    add_index :archives, :slug
    add_index :archives, :key
  end
end
