class BetaSignupsController < ApplicationController
  
  def create
    @beta_signup = BetaSignup.new(params[:beta_signup])
    if @beta_signup.save
      flash[:message] = "Thanks for signing up!"
    else
      flash[:message] = "You're already signed up! Thanks for your enthusiasm."
    end
    redirect_to root_path
  end
  
end
