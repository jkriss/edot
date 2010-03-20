class Category < ActiveRecord::Base
  
  has_many :category_subcategories
  has_many :subcategories, :through => :category_subcategories
  
end
