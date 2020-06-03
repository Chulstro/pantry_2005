require './lib/ingredient'
require './lib/recipe'
require 'minitest/autorun'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
  end

  def test_recipe_initial_values
    expected = {}
    assert_equal "Mac and Cheese", @recipe1.name
    assert_equal expected, @recipe1.ingredients_required
  end

  def test_it_can_add_ingredients
    expected = {
      @ingredient1 => 6,
      @ingredient2 => 8
    }
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)

    assert_equal expected, @recipe1.ingredients_required
    assert_equal [@ingredient1, @ingredient2], @recipe1.ingredients
  end
end
