class User < ActiveRecord::Base
  
  has_many :things
  
end
