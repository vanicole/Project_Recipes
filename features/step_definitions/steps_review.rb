Given /^I am a registered user$/ do
    @user = User.create!(:email => 'test@test.com', :password => 'test', :password_confirmation => 'test')
end
  
Given /^another users recipe (.*) exists$/ do |recipe|
    User.create(:email => 'test2@test.com', :password => 'test2', :password_confirmation => 'test2')
    login("test2@test.com", "test2")
    new_recipe(recipe, 'test2@test.com')
    visit(destroy_user_session_path)
end



module LoginSteps
    def register(email, password)
        visit(new_user_registration_path)
        fill_in('Email', :with => email)
        fill_in('Password', :with => password)
        fill_in('Password confirmation', :with => password)
        click_button('Sign up')
    end

    def login(email, password)
        visit(new_user_session_path)
        fill_in('Email', :with => email)
        fill_in('Password', :with => password)
        click_button('Log in')
    end
end

module RecipeSteps
    def new_recipe(title, user_id)
        visit(new_recipe_path)
        fill_in("Title", :with => title)
        fill_in("Ingredients", :with => "Tanti")
        fill_in("Preparation", :with => "Preparazione")
        fill_in("Dosage", :with => "4 persone")
        fill_in("Steps", :with => "Many steps for this recipe")
        fill_in("Difficulty", :with => "Alta")
        
        click_button("Creare Recipe")
    end
end



World(LoginSteps)
World(RecipeSteps)