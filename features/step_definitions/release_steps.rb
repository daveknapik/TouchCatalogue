Given /^there is a release entitled "([^"]*)"$/ do |arg1|
  @release = Factory.create(:release, :title => arg1)
end

When /^I change the title to "([^"]*)"$/ do |arg1|
  visit edit_release_path @release.id
  fill_in "Title", :with => arg1
  click_button "Update Release"
end

Then /^I should be on the release index page$/ do
  current_path.should == root_path
end

Then /^I should see "([^"]*)"$/ do |arg1|
  page.should have_content arg1
end