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
    let(:cookbook) { CookBook.new}
    let(:recipe1) { Recipe.new("Mac and Cheese") }
    let(:recipe2) { Recipe.new("Cheeseburger") }
  end
end