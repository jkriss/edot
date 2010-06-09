class Thing < ActiveRecord::Base
  
  belongs_to :subcategory, :foreign_key => 'thing_cat_id'
  belongs_to :user
  
  has_many :comments, :class_name => 'ThingComment'
  
  validates_presence_of :thing_cat_id, :message => "must be selected"
  
  def points
    subcategory.points
  end
  
  def safe_text
    text.blank? ? "a thing!" : text
  end
  
end
