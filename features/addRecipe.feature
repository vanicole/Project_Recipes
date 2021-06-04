Feature: User can manually add a recipe

Scenario: Add a recipe
    Given I am on Recipes View
    When I follow "Add A New Recipe"
    Then I should be on the Create New Recipe page
    When I fill in "Title" with "Tiramisù" 
    And I press "Create Recipe"
    Then I should be on the Recipes View
    #And I should see the title "Tiramisù"


