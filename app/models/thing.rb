class Thing < ActiveRecord::Base
  
  belongs_to :thing_cat
  belongs_to :user
  
  validates_presence_of :thing_cat_id
  
end
