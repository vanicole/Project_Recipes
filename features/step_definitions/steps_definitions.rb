require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
    def with_scope(locator)
        locator ? within(*selector_for(locator)) { yield } : yield
    end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
    visit path_to(page_name)
end

Given /^I am not a registered user$/ do
    @user = nil
end

Given /^I am a registered user$/ do
    @user = User.create!(:email => 'test@test.com', :password => 'testtest', :password_confirmation => 'testtest')
end

Given /^I am a banned user$/ do
    @user = User.create!(:roles_mask => 0, :email => 'banned@user.com', :password => 'testtest', :password_confirmation => 'testtest')
end

Given /^I am not authenticated$/ do
    visit new_user_session_path 
    #save_and_open_page
end

Given('I log in as registered user') do 
    @user = User.create!(id: 100, roles_mask: 1, :email => 'user@test.com', :password => 'testtest')
    @current_user = @user
    login(@user.email, @user.password)
end

Given /^I am a logged in admin user$/ do
    @user = User.create!(id: 100, roles_mask: 3, :email => 'admin@test.com', :password => 'testtest')
    @current_user = @user
    login(@user.email, @user.password)
    #save_and_open_page
end


When /^I log in$/ do
    if @user == nil
        login('test@test.com','test')
    else
        @current_user = @user
        login(@user.email, 'testtest')
    end
end

Given('I log in as banned user') do 
    @user = User.create!(id: 100, roles_mask: 0, :email => 'banned@test.com', :password => 'testtest')
    @current_user = @user
    login(@user.email, @user.password)
end

Then('I should see {string}') do |string|
    expect(page).to have_content(string)
end

Then /^(?:|I )should be on (.*)$/ do |page_name|
    current_path = URI.parse(current_url).path
    current_path == path_to(page_name)
    #save_and_open_page
end
  
When /^I register as (.+), (.+)$/ do |email, password|
    register(email, password)
    @user = User.find_by(email: email)
    @current_user = @user
end

Given('another users recipe {string} exists') do |recipe|
    User.create(roles_mask: 1, :email => 'fake@user.com', :password => 'testtest', :password_confirmation => 'testtest')
    login("fake@user.com", "testtest")
    new_recipe(recipe)
    visit(destroy_user_session_path)
    #save_and_open_page
end

Given ('another user exists') do
    User.create(roles_mask: 1, :email => 'other@user.com', :password => 'testtest', :password_confirmation => 'testtest')
end

When /^(?:|I )go to (.+)$/ do |page_name|
    visit path_to(page_name)
    #save_and_open_page
end

# Per vedere Details da Recipes page
When('I click on link {string}') do |string|
    within('td', text: string) do
        click_link(string)
        #save_and_open_page
    end
end

When('I follow {string}') do |string|
    expect(page).to have_content(string)
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
    select(value, :from => field)
end

When('I press {string}') do |string|
    click_button(string)
    #save_and_open_page
end

When('I press link {string}') do |string|
    click_link(string)
end

Then('I shoud see {string}') do |string|
    expect(page).to have_content(text)
    #save_and_open_page
end

Then ("I should not see link {string}") do |args1|
    expect(page).not_to have_link(text:/\A#{args1}\Z/)
    #save_and_open_page
end


Then ("I should see link {string}") do |args1|
    expect(page).to have_link(text:/\A#{args1}\Z/)
    #save_and_open_page
end

Then('I should have created a new recipe {string}') do |string|
    new_recipe(string)
    #save_and_open_page
end

Given('I wrote {string} recipe') do |title|
    new_recipe(title)
    #save_and_open_page
end

When('I fill in {string} with {string}') do |field, value|
    fill_in(field, :with => value)
end

module LoginSteps
    def login(email, password)
        visit(new_user_session_path)
        fill_in('Email', :with => email)
        fill_in('Password', :with => password)
        click_button('Log in')
    end
    def register(email, password)
        visit(new_user_registration_path)
        fill_in('Email', :with => email)
        fill_in('Password', :with => password)
        fill_in('Password confirmation', :with => password)
        click_button('Sign up')
    end
end


module RecipeSteps
    def new_recipe(title)
        visit(new_recipe_path)
        fill_in("Title", :with => title)
        click_button('Save Changes')
    end
end


World(LoginSteps)
World(RecipeSteps)
