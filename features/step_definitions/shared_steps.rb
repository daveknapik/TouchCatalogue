Given /^I am a logged\-in admin$/ do
  admin = Factory.build(:admin)
  admin.save_without_session_maintenance
  visit new_admin_session_path
  fill_in "Login", :with => admin.login
  fill_in "Password", :with => admin.password
  click_button "Login"
end

When /^I click on "([^"]*)"$/ do |arg1|
  click_link arg1
end

Then /^I should see "([^"]*)"$/ do |arg1|
  page.should have_content arg1
end