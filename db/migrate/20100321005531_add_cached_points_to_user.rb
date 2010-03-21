class AddCachedPointsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :cached_points, :integer
  end

  def self.down
    remove_column :users, :cached_points
  end
end
