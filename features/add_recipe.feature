Feature: Add a Recipe
    As a User 
    So that I can see it in the recipe list
    I want to add a recipe

Scenario: Add a Recipe
    Given I am a registered user 
    And I log in as registered user
    When I go to the recipes page
    And I click on link "Add A New Recipe"
    Then I should have created a new recipe "Tiramisu"
    And I should see "Tiramisu has been successfully created!"