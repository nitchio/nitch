class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :title, :slug, :username
      t.text :body
      t.integer :user_id, :nitch_id

      t.timestamps
    end

    add_index :archives, ["slug"], :name => "index_archives_on_slug"
    add_index :archives, ["username"], :name => "index_archives_on_username"
  end
end
