class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
      t.integer :user_id
      t.integer :thing_cat_id
      t.string :text

      t.timestamps
    end
  end

  def self.down
    drop_table :things
  end
end
