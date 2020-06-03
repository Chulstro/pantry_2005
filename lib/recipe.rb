
class Recipe
  attr_reader :name, :ingredients_required, :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    if @ingredients_required[ingredient] == nil
      @ingredients_required[ingredient] = amount
    else
      @ingredients_required[ingredient] = @ingredients_required[ingredient] +amount
    end
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    calories = ingredients.map do |ingredient|
      ingredient.calories * @ingredients_required[ingredient]
    end
    calories.sum do |ing_calories|
      ing_calories
    end
  end
end
