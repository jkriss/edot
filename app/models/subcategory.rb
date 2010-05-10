class Subcategory < ActiveRecord::Base
  
  default_scope :order => 'name asc'
  set_table_name 'thing_cats'
  has_many :category_subcategories
  has_many :categories, :through => :category_subcategories
  has_many :things, :foreign_key => 'thing_cat_id'

  def category
    categories.first
  end
  
end
