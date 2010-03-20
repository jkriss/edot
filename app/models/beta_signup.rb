class BetaSignup < ActiveRecord::Base
  
  validates_uniqueness_of :email_address
  
end
