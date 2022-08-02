require_relative 'spec_helper'

RSpec.describe CookBook do
  context 'Iteration 2' do
    let(:cookbook) { CookBook.new}
    let(:recipe1) { Recipe.new("Mac and Cheese") }
    let(:recipe2) { Recipe.new("Cheeseburger") }
  
    it 'exists' do
      expect(cookbook).to be_a(CookBook)
    end

    it '#recipes' do
      expect(cookbook.recipes).to eq([])
    end

    it '#add_recipe' do
      cookbook.add_recipe(recipe1)
      cookbook.add_recipe(recipe2)
      expect(cookbook.recipes).to eq([recipe1, recipe2])
    end
  end

  context 'Iteration 3' do
    let(:pantry) { Pantry.new }
    let(:cookbook) { CookBook.new }
    let(:ingredient1) { 
      Ingredient.new(
        {
          name: "Cheese", 
          unit: "C", 
          calories: 100
        }
      )
    }
    let(:ingredient2) { 
      Ingredient.new(
        {
          name: "Macaroni", 
          unit: "oz", 
          calories: 30
        }
      )
    }
    let(:recipe1) { Recipe.new("Mac and Cheese") }

    let(:ingredient3) { 
      Ingredient.new(
        {
          name: "Ground Beef", 
          unit: "oz", 
          calories: 100
        }
      )
    }
    let(:ingredient4) { 
      Ingredient.new(
        {
          name: "Bun", 
          unit: "g", 
          calories: 75
        }
      )
    }
    let(:recipe2) { Recipe.new("Cheese Burger")}

    before(:each) do
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)
      recipe2.add_ingredient(ingredient1, 2)
      recipe2.add_ingredient(ingredient3, 4)
      recipe2.add_ingredient(ingredient4, 1)
      cookbook.add_recipe(recipe1)
      cookbook.add_recipe(recipe2)
    end

    it '#ingredients' do
      expect(cookbook.ingredients).to eq(
        ["Cheese", "Macaroni", "Ground Beef", "Bun"]
      )
    end

    it '#highest_calorie_meal' do
      expect(cookbook.highest_calorie_meal).to eq(recipe2)
    end
  end
end