require 'rails_helper'

RSpec.describe Recipe, type: :model do

  it "Create a recipe" do
    user = User.create(:email => "user@test.it", :password => "12345678")
    recipe = Recipe.create(:title => "Tiramisù", :category => "Primo piatto", :dosage => "2 persone", :difficulty => "Alta", :preparation => "20 minuti", :ingredients => "Vari", :steps => "Tanti step", :user_id => "#{user.id}")
    expect(Recipe.first).to eq(recipe)
  end

  it "Create a recipe witout title" do
    user = User.create(:email => "user@test.it", :password => "12345678")
    recipe = Recipe.create(:category => "Primo piatto", :dosage => "2 persone", :difficulty => "Alta", :preparation => "20 minuti", :ingredients => "Vari", :steps => "Tanti step", :user_id => "#{user.id}")
    expect(recipe).not_to be_valid
  end

  it "Create a recipe with step too short" do
    user = User.create(:email => "user@test.it", :password => "12345678")
    recipe = Recipe.create(:title => "Tiramisù", :category => "Primo piatto", :dosage => "2 persone", :difficulty => "Alta", :preparation => "20 minuti", :ingredients => "Vari", :steps => "Low", :user_id => "#{user.id}")
    expect(recipe).not_to be_valid
  end

end
