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
end