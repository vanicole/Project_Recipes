Feature: Add a Review
    As a User 
    so that I can view the rating of a recipe
    I want to add a review

    Scenario: Registered User can add a review to a recipe written by another user
        Given I am a registered user 
        And another users recipe 'Tiramisu' exists
        And I log in as registered user
        When I go to the recipes page
        And I click on link "Details"
        And I follow "Add a Review"
        And I select "9" from "Vote"
        And I press "Add Review"
        Then I should see "Vote: 9"

    Scenario: Admin can add a review to a recipe written by another user
        Given I am a registered user 
        And another users recipe 'Tiramisu' exists
        And I am a logged in admin user
        When I go to the recipes page
        And I click on link "Details"
        And I follow "Add a Review"
        And I select "9" from "Vote"
        And I press "Add Review"
        Then I should see "Vote: 9"

    Scenario: Banned User cannot add a review to a recipe written by another user
        Given I am a banned user
        And another users recipe 'Tiramisu' exists
        And I log in as banned user
        When I go to the recipes page
        And I click on link "Details"
        And I follow "Add a Review"
        And I select "9" from "Vote"
        And I press "Add Review"
        Then I shoud see "You are not authorized"

    Scenario: Registered User cannot add a review to his recipe
        Given I am a registered user 
        And I log in as registered user
        And I wrote 'Tiramisu' recipe
        When I go to the homepage
        And I click on link "Details"
        Then I should not see link 'Add Review'



