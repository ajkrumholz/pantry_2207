class Recipe
  attr_reader :name,
              :ingredients_required,
              :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
    @ingredients = []
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
    @ingredients = @ingredients_required.keys
  end
end
