require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'
require './lib/pantry'
require 'minitest/autorun'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
    @pantry = Pantry.new
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

  def test_cookbook_recipes
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal [@recipe1, @recipe2], @cookbook.recipes
  end

  def test_recipe_total_calories
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    assert_equal 440, @recipe1.total_calories
    assert_equal 675, @recipe2.total_calories
  end

  def test_cookbook_calories
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], @cookbook.ingredients
    assert_equal @recipe2, @cookbook.highest_calorie_meal
  end

  def test_if_pantry_has_enough
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    assert_equal false, @pantry.has_enough_ingredients_for?(@recipe1)

    @pantry.restock(@ingredient2, 7)

    assert_equal false, @pantry.has_enough_ingredients_for?(@recipe1)

    @pantry.restock(@ingredient2, 1)

    assert_equal true, @pantry.has_enough_ingredients_for?(@recipe1)
  end
end
