class HomeController < ApplicationController
  
  before_filter :load_stuff
  
  def index
    today = Time.zone.today
    @todays_totals = Category.all
    @todays_totals.collect! do|c|
      {
        :category => c,
        :total => c.total_points(['created_at > ?', today.to_time.utc])
      }
    end
    puts @todays_totals.inspect
    @todays_totals.sort!{ |a,b| puts a.inspect; b[:total] <=> a[:total] }
  end
  
  def feeds
    render :partial => 'feeds'
  end
  
  private
  def load_stuff
    @latest_things = Thing.find(:all, :order => "created_at desc", :limit => 3)
    # @top_users = User.find(:all, :conditions => 'cached_points > 0', :order => 'cached_points desc', :limit => 10)
  end
  
end
