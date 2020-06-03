require 'minitest/autorun'
require './lib/ingredient'
require './lib/pantry'

class IngredientTest < Minitest::Test

  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
  end

  def test_ingredient_initial_values
    assert_equal "Cheese", @ingredient1.name
    assert_equal "oz", @ingredient1.unit
    assert_equal 50, @ingredient1.calories
  end

  def test_pantry_initial_values
    expected = {}
    assert_equal expected , @pantry.stock
  end
end
