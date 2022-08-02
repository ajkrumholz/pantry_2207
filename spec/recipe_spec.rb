require_relative 'spec_helper'

RSpec.describe Recipe do
  context 'Iteration 2' do
    let(:ingredient1) {
      Ingredient.new(
        {
          name: "Cheese", 
          unit: "oz", 
          calories: 50
          }
        )
      }
    let(:ingredient2) {
      Ingredient.new(
        {
          name: "Macaroni", 
          unit: "oz", 
          calories: 200
          }
        )
      }
    let(:recipe1) { Recipe.new("Mac and Cheese") }
    let(:recipe2) { Recipe.new("Cheeseburger") }
    
    it 'exists' do
      expect(recipe1).to be_a(Recipe)
    end

    it '#name' do
      expect(recipe1.name).to eq("Mac and Cheese")
    end

    it '#ingredients_required' do
      expect(recipe1.ingredients_required).to eq({})
    end

    it '#add_ingredient' do
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient1, 4)
      recipe1.add_ingredient(ingredient2, 8)
      expected = {
        ingredient1 => 6,
        ingredient2 => 8
      }
      expect(recipe1.ingredients_required).to eq(expected)
      expect(recipe1.ingredients).to eq([ingredient1, ingredient2])
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
    end

    it '#total_calories' do
      expect(recipe1.total_calories).to eq(440)
      expect(recipe2.total_calories).to eq(675)
    end

  end
end