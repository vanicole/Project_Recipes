Feature: Signup
    As a Guest 
    so that I can become a User
    I want to sign up with e-mail and password

Scenario: Guest signed up successfully
    Given I am not a registered user
    And I am on the home page
    And I am not authenticated
    When I register as test@test.com, testtest
    Then I should be on the recipes page
    And I should see "Welcome! You have signed up successfully."

Scenario: Guest failed to register
    Given I am not a registered user 
    And I am on the home page
    And I am not authenticated
    When I register as user, useruser
    Then I should be on the users page
    And I should see "error"


