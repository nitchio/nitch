class CreateInviteRequests < ActiveRecord::Migration
  def change
    create_table :invite_requests do |t|
      t.integer :nitch_id
      t.integer :user_id

      t.timestamps
    end
  end
end
