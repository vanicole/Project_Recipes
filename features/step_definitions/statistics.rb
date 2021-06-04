Given(/^I am on recipes list$/) do
    visit "recipes"
end

Then(/^I should see table heading "(.*?)"$/) do |string|
    page.should have_selector("th", :text => string)
end