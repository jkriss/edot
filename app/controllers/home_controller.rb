class HomeController < ApplicationController
  
  def index
    @beta_signup = BetaSignup.new
  end
  
end
