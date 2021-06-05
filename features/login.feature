Feature: Login
    As a registered user
    So that I can access all the features
    I want to login with e-mail


Scenario: Successful Login
    Given I am a registered user
    And I am on the home page
    And I am not authenticated
    When I log in
    Then I should be on the recipes page
    And I should see "Signed in successfully."

Scenario: Failed Login
    Given I am not a registered user
    And I am on the home page
    And I am not authenticated
    When I log in
    Then I should be on the login page
    And I should see "Invalid Email or password."