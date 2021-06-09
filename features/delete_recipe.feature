Feature: Delete a Recipe
    As an Admin 
    So that I can delete a recipe
    I want to have special setting

Scenario: Delete a Recipe
    Given I am a registered user 
    And another users recipe 'Tiramisu' exists
    And I am a logged in admin user
    When I go to the recipes page
    And I click on link "Details"
    And I click on link "Delete recipe"
    Then I should see "Tiramisu has been successfully deleted!"