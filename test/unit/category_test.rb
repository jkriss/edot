require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "add subcategories" do
    s = Subcategory.create(:name => "Biking")
    c = Category.create(:name => "Transit")
    
    assert !c.subcategories.include?(s)
    
    c.subcategories << s
    
    assert c.subcategories.include?(s)
  end
  
end
