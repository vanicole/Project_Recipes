Feature: Add a Recipe
    As a User 
    So that I can see it in the recipe list
    I want to add a recipe.

    As a User 
    So that I can view the recipes published by myself
    I want to view my recipes page.

    Scenario: Registered User add a recipe successfully
        Given I am a registered user 
        And I log in as registered user
        When I go to the recipes page
        And I click on link "Add A New Recipe"
        Then I should have created a new recipe "Tiramisu"
        And I should see "Tiramisu has been successfully created!"
        When I go to the my recipes page 
        Then I should see "Tiramisu"

    Scenario: Admin User add a recipe successfully
        Given I am a registered user 
        And I am a logged in admin user
        When I go to the recipes page
        And I click on link "Add A New Recipe"
        Then I should have created a new recipe "Tiramisu"
        And I should see "Tiramisu has been successfully created!"

    Scenario: Guest cannot add a recipe
        Given I am not a registered user
        And I am on the homepage
        Then I should not see link "Add a New Recipe"

    Scenario: Banned user cannot add a recipe
        Given I am a registered user
        And I log in as banned user
        And I am on the homepage
        Then I should not see link "Add a New Recipe"   