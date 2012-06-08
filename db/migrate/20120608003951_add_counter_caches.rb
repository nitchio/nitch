class AddCounterCaches < ActiveRecord::Migration
  def up
    # User counter caches
    add_column :users, :nitches_count, :integer
    add_column :users, :archives_count, :integer
    add_column :users, :posts_count, :integer
    add_column :users, :comments_count, :integer

    # Nitch counter caches
    add_column :nitches, :users_count, :integer
    add_column :nitches, :archives_count, :integer
    add_column :nitches, :posts_count, :integer
    add_column :nitches, :comments_count, :integer

    # Archive counter caches
    add_column :archives, :posts_count, :integer
    add_column :archives, :comments_count, :integer

    # Post counter caches
    add_column :posts, :comments_count, :integer
  end

  def down
  end
end
