class ThingComment < ActiveRecord::Base
  
  belongs_to :thing
  belongs_to :user
  
  validates_presence_of :thing_id, :user_id, :comment
  
end
