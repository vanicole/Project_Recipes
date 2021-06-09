Feature: Add a Review
    As a User 
    so that I can view the rating of a recipe
    I want to add a review

Scenario: Add a Review successfully
    Given I am a registered user 
    And another users recipe 'Tiramisu' exists
    And I log in as registered user
    When I go to the recipes page
    And I click on link "Details"
    And I follow "Add a Review"
    And I select "9" from "Vote"
    And I press "Add Review"
    Then I should see "Vote: 9"

Scenario: Add a Review unsuccessfully
    Given I am a banned user
    And another users recipe 'Tiramisu' exists
    And I log in as banned user
    When I go to the recipes page
    And I click on link "Details"
    And I follow "Add a Review"
    And I select "9" from "Vote"
    And I press "Add Review"
    Then I shoud see "You are not authorized"