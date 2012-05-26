class CreateNitches < ActiveRecord::Migration
  def change
    create_table :nitches do |t|
      t.string :title
      t.string :name
      t.text :description
      t.string :privacy

      t.timestamps
    end

    add_index :nitches, ["name"], :name => "index_nitches_on_name", :unique => true
  end
end
