Given /^I am a logged\-in admin$/ do
  admin = Factory.create(:admin)
  visit new_admin_session_path
  fill_in "Login", :with => admin.login
  fill_in "Password", :with => admin.password
  click_button "Login"
end