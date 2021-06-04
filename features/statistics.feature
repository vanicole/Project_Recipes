Feature: Statistics
    So that I can see the recipe rating
    As a user
    I want to see the Average Review Rating

        Scenario: View Rating for Recipe
            Given I am on recipes list
            Then I should see table heading "Rating"
