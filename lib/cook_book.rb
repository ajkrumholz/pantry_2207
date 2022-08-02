class CookBook
  attr_reader :recipes,
              :ingredients

  def initialize
    @recipes = []
    @ingredients = []
  end

  def add_recipe(recipe)
    @recipes << recipe
    add_ingredient(recipe)
  end

  def add_ingredient(recipe)
    recipe.ingredients.each do |ingredient|
      @ingredients << ingredient.name
    end
    @ingredients.uniq!
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end
end
