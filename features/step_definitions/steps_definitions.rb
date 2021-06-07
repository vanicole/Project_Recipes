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



Given /^I am a registered user$/ do
    @user = User.create!(:email => 'test@test.com', :password => 'testtest', :password_confirmation => 'testtest')
end

Given /^I am on the home page$/ do
end

Given /^I am not authenticated$/ do
    visit new_user_session_path 
end

When /^I log in$/ do
    if @user == nil
        login('test@test.com','test')
    else
        @current_user = @user
        login(@user.email, 'testtest')
    end
end


Then /^(?:|I )should be on (.*)$/ do |page_name|
    current_path = URI.parse(current_url).path
    current_path == path_to(page_name)
end
  

Then('I should see {string}') do |string|
    expect(page).to have_content(string)
end

Given /^I am not a registered user$/ do
    @user = nil
end

When /^I register as (.+), (.+)$/ do |email, password|
    register(email, password)
    @user = User.find_by(email: email)
    @current_user = @user
end

Given /^I am a logged in admin user$/ do
    @user = User.create!(id: 100, roles_mask: 3, :email => 'test@test.com', :password => 'testtest')
    @current_user = @user
    login(@user.email, @user.password)
end

Given('another users recipe {string} exists') do |recipe|
    User.create(:email => 'fake@user.com', :password => 'testtest', :password_confirmation => 'testtest')
    login("fake@user.com", "testtest")
    new_recipe(recipe)
    visit(destroy_user_session_path)
end

When /^(?:|I )go to (.+)$/ do |page_name|
    visit path_to(page_name)
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
        click_button("Save Changes")
    end
end


#module ReviewSteps
    #def new_review(recipe)
        #visit(new_recipe_review_path(recipe))
        #select(5, :from => 'Vote')
        #fill_in("Comment", :with => "Very good")
        #click_button('Add Review')
    #end
#end

World(LoginSteps)
#World(ReviewSteps)
World(RecipeSteps)