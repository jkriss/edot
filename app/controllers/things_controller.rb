class ThingsController < ApplicationController
  
  before_filter :login_required, :for => :new
  
  def new
    @thing = current_user.things.new
    @categories = Category.all
  end
  
  def show
    @thing = Thing.find(params[:id])
  end
  
  def create
    @thing = current_user.things.new(params[:thing])
    if @thing.save
      redirect_to current_user
    else
      @categories = Category.all
      render :new
    end
  end
  
end
