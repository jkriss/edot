class CreateThingCats < ActiveRecord::Migration
  def self.up
    create_table :thing_cats do |t|
      t.string :name
      t.integer :points

      t.timestamps
    end
  end

  def self.down
    drop_table :thing_cats
  end
end
