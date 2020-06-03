
class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
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
end
