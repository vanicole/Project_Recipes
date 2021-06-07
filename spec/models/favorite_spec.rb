require 'rails_helper'

RSpec.describe FavoriteRecipe, type: :model do

  it "Create a favorite relationship between users and recipes" do
    user = User.create(:email => "test@test.it", :password => "12345678")
    recipe = Recipe.create(:title => "Tiramisù", :category => "Primo piatto", :dosage => "2 persone", :difficulty => "Alta", :preparation => "20 minuti", :ingredients => "Vari", :steps => "Tanti step", :user_id => "#{user.id}")
    favorite = FavoriteRecipe.create(:user => user, :recipe => recipe)
    expect(user.favorites.first).to eq(recipe)
  end

  it "Create a favorite relationship without recipe" do
    user = User.create(:email => "test@test.it", :password => "12345678")
    favorite = FavoriteRecipe.create(:user => user)
    expect(favorite).not_to be_valid
  end
end
