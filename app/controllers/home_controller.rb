class HomeController < ApplicationController
  
  def index
    @beta_signup = BetaSignup.new
    @count = BetaSignup.count
    
    @latest_things = Thing.find(:all, :order => "created_at desc", :limit => 10)
    @top_users = User.find(:all, :conditions => 'cached_points > 0', :order => 'cached_points desc', :limit => 10)
  end
  
end
