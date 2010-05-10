class Category < ActiveRecord::Base
  
  default_scope :order => 'name asc'
  has_many :category_subcategories
  has_many :subcategories, :through => :category_subcategories
  
  def total_points(conditions={})
    total = 0
    subcategories.each do |s|
      s.things.find(:all, :conditions => conditions).each do |t|
        total += t.points
      end
    end
    total
  end
  
end
