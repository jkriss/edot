class AddTopUserUpdateTimeToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :top_user_updated_at, :datetime
  end

  def self.down
    remove_column :categories, :top_user_updated_at
  end
end
