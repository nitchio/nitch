class CreateNitches < ActiveRecord::Migration
  def change
    create_table :nitches do |t|
      t.string :title
      t.string :name
      t.integer :privacy

      t.timestamps
    end
  end
end
