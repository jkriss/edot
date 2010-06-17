class AddLeaderAndScoreToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :top_user_id, :integer
    add_column :categories, :top_user_score, :integer
  end

  def self.down
    remove_column :categories, :top_user_id
    remove_column :categories, :top_user_score
  end
end
