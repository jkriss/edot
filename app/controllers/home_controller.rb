class HomeController < ApplicationController
  
  def index
    @beta_signup = BetaSignup.new
    @count = BetaSignup.count
  end
  
end
