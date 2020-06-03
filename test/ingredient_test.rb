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

  def test_it_can_check_stock
    assert_equal 0, @pantry.stock_check(@ingredient1)
  end

  def test_it_can_restock
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    assert_equal 15, @pantry.stock_check(@ingredient1)
  end
end
