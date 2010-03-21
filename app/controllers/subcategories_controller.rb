class SubcategoriesController < ApplicationController
  
  before_filter :require_admin
  
  def new
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.new
  end
  
  def edit
    @subcategory = Subcategory.find(params[:id])
  end
  
end
