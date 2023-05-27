require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'アソシエーション' do
    it 'GenreTagモデルとの関係は1対Nであること' do
      association = described_class.reflect_on_association(:genre_tags)
      expect(association.macro).to eq :has_many
    end

    it 'IngredientTagモデルとの関係は1対Nであること' do
      association = described_class.reflect_on_association(:ingredient_tags)
      expect(association.macro).to eq :has_many
    end
  end
end
