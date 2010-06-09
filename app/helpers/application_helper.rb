# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def local(date)
    TZInfo::Timezone.get('America/Los_Angeles').utc_to_local(date)
  end
  
  def format(date)
    local(date).strftime("%B %d, %I:%M %p")
  end
  
end
