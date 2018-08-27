require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  def setup
    @chef = User.create!(name: "Phuc Truong", email: "tvphuc279@gmail.com")
    @recipe = @chef.recipes.create(name: "vegetable saute", description: "great vegetable sautee,  add vegetable and oil")
    @recipe2 = @chef.recipes.create(name: "chicken saute", description: "great chicken dish")
  end
  
  test "should get recipes index" do
    get recipes_url
    assert_response :success
  end
  
  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
end
