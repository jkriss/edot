class AddTwitterFieldsToUser < ActiveRecord::Migration
  def self.up
    [:twitter_id, :access_token, :access_secret, :location, :description, :profile_image_url, :url, :profile_background_color, 
      :profile_sidebar_fill_color, :profile_link_color, :profile_sidebar_border_color, :profile_text_color, :profile_background_image_url,
      :profile_background_tile, :time_zone].each do |f|
        add_column :users, f, :string
    end
      
    [:friends_count, :statuses_count, :followers_count, :favourites_count, :utc_offset].each do |f|
      add_column :users, f, :integer
    end
  end

  def self.down
  end
end