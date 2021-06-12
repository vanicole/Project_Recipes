Feature: View user list
    As an Admin 
    So that I can make another user as admin
    I want to have special setting.

     As an Admin 
    So that I can ban any User
    I want to have special privileges.


    Scenario: Admin can make another user as admin 
        Given I am a logged in admin user
        And another user exists
        When I go to the admin page
        And I click on link "Make Admin"
        Then I should see link "Remove Admin"

    Scenario: Admin can ban a user
        Given I am a logged in admin user
        And I go to the admin page
        When I click on link "Ban" 
        Then I should see link "Remove Ban"
        And I should see link "Make Admin"