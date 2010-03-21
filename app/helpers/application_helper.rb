# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def local(date)
    Time.zone.utc_to_local(date)
  end
  
end
