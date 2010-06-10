class AddLastCommentViewToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :last_comment_view, :datetime
  end

  def self.down
    remove_column :users, :last_comment_view
  end
end
