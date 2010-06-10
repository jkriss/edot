class ThingCommentsController < ApplicationController
  
  before_filter :login_required
  
  def create
    @thing = Thing.find(params[:thing_id])
    @comment = @thing.comments.new(params[:thing_comment].merge(:user => current_user))
    if @comment.save
      redirect_to @thing
    else
      render 'things/show'
    end
  end
  
  def replies
    @comments = current_user.replies.find(:all, :limit => 50)
    @last_view = current_user.last_comment_view
    current_user.last_comment_view = Time.now
    current_user.save
  end
  
  def destroy
    @comment = ThingComment.find(params[:id])
    @comment.destroy if logged_in? && @comment.user == current_user
    redirect_to thing_path(params[:thing_id])
  end
  
end
