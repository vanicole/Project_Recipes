Feature: Add a Review
    As a User 
    so that I can view the rating of a recipe
    I want to add a review

Scenario: Add a Review
    Given I am a registered user 
    And another users recipe 'Tiramisu' exists
    And I log in as registered user
    When I go to the recipes page
    And I click on link "Details"