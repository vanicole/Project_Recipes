Feature: Add recipe to favorite list
    As a User
    So that I can add recipes to your favourite list
    I want to add a recipe to my favourites list.
    
    As a User
    So that I can remove recipes to your favourite list
    I want to remove a recipe to my favourites list.

    Scenario: User can add a recipe to his favorites list
        Given I am a registered user 
        And another users recipe 'Tiramisu' exists
        And I log in as registered user
        When I go to the recipes page
        And I click on link "Details"
        And I press link "Add to Favorites"
        Then I should see "You favorited Tiramisu"
        When I go to the my favorite page 
        Then I should see link "Remove from Favorites"

    Scenario: Guest cannot add a recipe to his favorites list
        Given I am not a registered user
        And another users recipe 'Tiramisu' exists
        And I am on the homepage
        When I click on link "Details"
        Then I should not see link "Add to Favorites"
    