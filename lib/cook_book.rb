
class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
    @time = Time.now
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    recipe_ingredients =[]
    @recipes.each do |recipe|
      recipe_ingredients << recipe.ingredients
    end
    recipe_ingredients.flatten.map do |ingredient|
      ingredient.name
    end.uniq
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def date
    @time.strftime("%m-%d-%Y")
  end
end
