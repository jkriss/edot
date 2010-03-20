class ThingsController < ApplicationController
  
  before_filter :login_required, :for => :new
  
  def new
    @thing = current_user.things.new
    @cats = Subcategory.all
  end
  
  def create
    @thing = current_user.things.create!(params[:thing])
    redirect_to current_user
  end
  
end
