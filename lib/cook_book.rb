class CookBook
  attr_reader :recipes,
              :ingredients,
              :date

  def initialize
    @recipes = []
    @ingredients = []
    @date = Time.now.strftime("%m/%d/%Y")
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

  def summary
    @recipes.map do |recipe|
      {
        name: recipe.name,
        details: {
          ingredients: ingredient_detail_array(recipe),
          total_calories: recipe.total_calories
        }
      }
    end
  end

  def ingredient_detail_array(recipe)
    recipe.ingredients_required.map do |ingredient, amount|
      {
        ingredient: ingredient.name, 
        amount: "#{amount} #{ingredient.unit}"
      }
    end
  end
end
