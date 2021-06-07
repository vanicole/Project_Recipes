require 'rails_helper'

RSpec.describe Review, type: :model do

  it "Create a review for a recipe" do 
    user = User.create(:email => "user@test.it", :password => "12345678")
    recipe = Recipe.create(:title => "Recipe", :category => "Primo piatto", :dosage => "2 persone", :difficulty => "Alta", :preparation => "20 minuti", :ingredients => "Vari", :steps => "Tanti step", :user_id => user.id)
    review = recipe.reviews.create(:vote => "5", :comment => "Good", :user_id => user.id)
    expect(recipe.reload.reviews.first).to eq(review)
  end

  it "Creare a review for a recipe with vote but without comment" do 
    user = User.create(:email => "user@test.it", :password => "12345678")
    recipe = Recipe.create(:title => "Recipe", :category => "Primo piatto", :dosage => "2 persone", :difficulty => "Alta", :preparation => "20 minuti", :ingredients => "Vari", :steps => "Tanti step", :user_id => user.id)
    review = recipe.reviews.create(:vote => "5", :user_id => user.id)
    expect(recipe.reload.reviews.first).to eq(review)
  end
end
