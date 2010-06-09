class CreateThingComments < ActiveRecord::Migration
  def self.up
    create_table :thing_comments do |t|
      t.integer :thing_id
      t.integer :user_id
      t.string :comment, :limit => 2500

      t.timestamps
    end
  end

  def self.down
    drop_table :thing_comments
  end
end
