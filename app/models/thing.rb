class Thing < ActiveRecord::Base
  
  belongs_to :subcategory, :foreign_key => 'thing_cat_id'
  belongs_to :user
  
  validates_presence_of :thing_cat_id
  
  def points
    subcategory.points
  end
  
end
