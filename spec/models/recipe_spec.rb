require 'rails_helper'

RSpec.describe Recipe, type: :model do

  it "Create a recipe" do
    user = User.create(:email => "user@test.it", :password => "12345678")
    recipe = Recipe.create(:title => "Tiramisu", :user_id => "#{user.id}")
    expect(recipe).to be_valid
  end

  it "Create a recipe witout title" do
      user = User.create(:email => "user@test.it", :password => "12345678")
      recipe = Recipe.create(:user_id => "#{user.id}")
      expect(recipe).not_to be_valid
  end

end
