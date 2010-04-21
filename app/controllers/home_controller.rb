class HomeController < ApplicationController
  
  before_filter :load_stuff
  
  def index
    today = Time.zone.today
    @todays_totals = get_totals
    @user_totals = get_totals(:user_id => current_user.id) if logged_in?
    
    if logged_in?
      @thing = current_user.things.new
      @categories = Category.all
    end
    
  end
  
  def feeds
    render :partial => 'feeds'
  end
  
  def top
    @top_users = User.find(:all, :order => 'cached_points desc', :limit => 20)
  end
  
  private
  def load_stuff
    @latest_things = Thing.find(:all, :order => "created_at desc", :limit => 3)
    # @top_users = User.find(:all, :conditions => 'cached_points > 0', :order => 'cached_points desc', :limit => 10)
  end
  
  def get_totals(conditions={})
    totals = Category.all
    totals.collect! do|c|
      {
        :category => c,
        :total => c.total_points(conditions)
      }
    end
    totals.sort!{ |a,b| puts a.inspect; b[:total] <=> a[:total] }
  end
  
end
