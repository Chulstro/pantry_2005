
class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient] == nil
      0
    else
      @stock[ingredient]
    end
  end

  def restock(ingredient, amount)
    @stock[ingredient] = stock_check(ingredient) + amount
  end

  def has_enough_ingredients_for?(recipe)
    has_items = recipe.ingredients.map do |ingredient|
      if @stock[ingredient] == nil
        false
      else
        @stock[ingredient] >= recipe.ingredients_required[ingredient]
      end
    end
    !(has_items.include? false)
  end
end
