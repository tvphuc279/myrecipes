require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = User.create!(name: "Phuc Truong", email: "tvphuc@example.com")
    @recipe = @chef.recipes.build(name: 'Breakfast', description: 'Greate breakfast today when you are here!')
  end
  
  test "recipe should be valid" do 
    assert @recipe.valid?
  end
  
  test "recipe name should be present" do 
    @recipe.name = ' '
    assert_not @recipe.valid?
  end
  
  test "recipe description should be present" do 
    @recipe.description = ' '
    assert_not @recipe.valid?
  end
  
  test "recipe description length minimum should be greater than 5 characters" do 
    @recipe.description = 'a'*3 
    assert_not @recipe.valid?
  end
  
  test "recipe description length maximum should be less than 500 characters" do 
    @recipe.description = 'a'*501 
    assert_not @recipe.valid?
  end
  
  test "recipe without chef should be invalid" do
    @recipe.user_id = nil
    assert_not @recipe.valid?
  end
end
