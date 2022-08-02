require_relative 'spec_helper'

RSpec.describe Pantry do
  context 'Iteration 1' do
    let(:pantry) {Pantry.new}
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

    it 'exists' do
      expect(pantry).to be_a(Pantry)
    end

    it '#stock' do
      expect(pantry.stock).to eq({})
    end

    it '#stock_check' do
      expect(pantry.stock_check(ingredient1)).to eq(0)
    end

    it '#restock' do
      pantry.restock(ingredient1, 5)
      pantry.restock(ingredient1, 10)
      expect(pantry.stock_check(ingredient1)).to eq(15)

      pantry.restock(ingredient2, 7)
      expect(pantry.stock_check(ingredient2)).to eq(7)
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

    it '#enough_ingredients_for?' do
      pantry.restock(ingredient1, 5)
      pantry.restock(ingredient1, 10)
      expect(pantry.enough_ingredients_for?(recipe1)).to be(false)
      pantry.restock(ingredient2, 7)
      expect(pantry.enough_ingredients_for?(recipe1)).to be(false)
      pantry.restock(ingredient2, 1)
      expect(pantry.enough_ingredients_for?(recipe1)).to be(true)
    end
  end
end