class HomeController < ApplicationController
  
  before_filter :load_stuff
  
  def index
  end
  
  def feeds
    render :partial => 'feeds'
  end
  
  private
  def load_stuff
    @latest_things = Thing.find(:all, :order => "created_at desc", :limit => 10)
    @top_users = User.find(:all, :conditions => 'cached_points > 0', :order => 'cached_points desc', :limit => 10)
  end
  
end
