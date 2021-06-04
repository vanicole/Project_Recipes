Given('I am on Recipes View') do
    visit 'recipes' # GET /recipes
end

When('I follow {string}') do |string|
    click_link(string)
end

Then('I should be on the Create New Recipe page') do
    current_path = URI.parse(current_url).path  
    current_path == '/recipes/new' 
end

When('I fill in {string} with {string}') do |field, value|
    fill_in(field, :with => value)
end

When('I press {string}') do |string|
    click_button(string)
end

Then('I should be on the Recipes View') do
    current_path = URI.parse(current_url).path
    current_path == '/recipes'
end

Then('I should see the title {string}') do |string|
    assert page.has_content?(string)
end
