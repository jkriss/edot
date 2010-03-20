require 'test_helper'

class ThingTest < ActiveSupport::TestCase

  test "things" do
    u = User.create(:login => 'jk', :email => 'jesse@jklabs.net')
    cat = ThingCat.create(:name => 'My First Category')
    t = u.things.create(:text => "I did stuff!", :thing_cat => cat)
    
    assert u.things.include?(t)
  end
  
end
