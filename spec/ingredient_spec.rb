require_relative 'spec_helper'

RSpec.describe Ingredient do
  context 'Iteration 1' do
    let(:ingredient_1) {
      Ingredient.new(
        {
          name: "Cheese", 
          unit: "oz", 
          calories: 50
          }
        )
      }
      let(:ingredient_2) {
        Ingredient.new(
          {
            name: "Macaroni", 
            unit: "oz", 
            calories: 200
            }
          )
        }

    it 'exists' do
      expect(ingredient_1).to be_a(Ingredient)
      expect(ingredient_2).to be_a(Ingredient)
    end

    it '#name' do
      expect(ingredient_1.name).to eq("Cheese")
    end

    it '#unit' do
      expect(ingredient_1.unit).to eq("oz")
    end

    it '#calories' do
      expect(ingredient_1.calories).to eq(50)
    end
  end
end