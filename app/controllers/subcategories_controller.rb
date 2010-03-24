class SubcategoriesController < ApplicationController
  
  before_filter :require_admin
  
  def new
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.new
  end
  
  def edit
    @subcategory = Subcategory.find(params[:id])
  end
  
  def update
    @subcategory = Subcategory.find(params[:id])
    @subcategory.update_attributes!(params[:subcategory])
    redirect_to edit_category_path(@subcategory.category)
  end
  
  def create
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.create!(params[:subcategory])
    redirect_to edit_category_path(@subcategory.category)
  end

end
