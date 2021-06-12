Feature: Edit a Recipe
    As a User
    So that I can edit the information of a recipe
    I want to edit my recipe

    Scenario: Registered User can edit one of his recipe
        Given I am a registered user 
        And I log in as registered user
        And I wrote 'Tiramisu' recipe
        When I go to the homepage
        And I click on link "Details"
        And I click on link "Edit recipe"
        When I fill in 'Title' with 'Panna Cotta'
        And I press 'Save Changes'
        Then I should see "Panna Cotta has been successfully changed!"

    Scenario: Registered User cannot edit recipes written by other users
        Given I am a registered user 
        And another users recipe 'Tiramisu' exists
        And I log in as registered user
        When I go to the homepage
        And I click on link "Details"
        Then I should not see link "Edit recipe"   

