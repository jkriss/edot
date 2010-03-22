# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  layout "default"
  
  include AuthenticatedSystem
  
  def require_admin
    redirect_to root_path unless logged_in? && current_user.is_admin
  end
  
  helper_method :iphone?
  
  def iphone?
    request.user_agent && request.user_agent.include?("iPhone")
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
