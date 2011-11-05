Given /^there is a release entitled "([^"]*)"$/ do |arg1|
  @release = Factory.create(:release, :title => arg1)
end

Given /^I am on the new release page$/ do
  visit new_release_path
end

Given /^I am on the release index page$/ do
  visit releases_path
end

When /^I add a new release$/ do
  @release = Factory.build(:release)
  select @release.publisher, :from => "Publisher"
  fill_in "Catalogue number", :with => @release.catalogue_number
  fill_in "Artist name", :with => @release.artist.name
  fill_in "Title", :with => @release.title
  fill_in "Duration", :with => @release.duration
  fill_in "Description", :with => @release.description
  fill_in "Track listing", :with => @release.track_listing
  select @release.release_date.year.to_s, :from => "release_release_date_1i"
  select Date::MONTHNAMES[@release.release_date.month], :from => "release_release_date_2i"
  select @release.release_date.day.to_s, :from => "release_release_date_3i"
  fill_in "Release url", :with => @release.release_url
  fill_in "Cover art url", :with => @release.cover_art_url
  fill_in "Itunes url", :with => @release.itunes_url
  fill_in "Mp3 sample url", :with => @release.mp3_sample_url
  fill_in "Reviews", :with => @release.reviews
  click_button "Create Release"
end

When /^I change the title to "([^"]*)"$/ do |arg1|
  visit edit_release_path @release.id
  fill_in "Title", :with => arg1
  click_button "Update Release"
end

Then /^I should be on the new release page$/ do
  current_path.should == new_release_path
end

Then /^I should be on the release index page$/ do
  current_path.should be_in [root_path, releases_path]
end

Then /^I should see that release listed$/ do
  page.should have_content @release.catalogue_number
  page.should have_content @release.artist.name
  page.should have_content @release.title
  page.should have_content @release.release_date
  page.should have_content @release.publisher
end