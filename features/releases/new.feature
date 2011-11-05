Feature: New Release
	In order to add new releases to the catalogue
	As an employee of this record label
	I want to create a new release

Background:
	Given I am a logged-in admin

Scenario: Visit the new release page from the release index page
	Given I am on the release index page
	When I click on "Add new release"
	Then I should be on the new release page

Scenario:
	Given I am on the new release page
	When I add a new release
	Then I should be on the release index page
	And I should see that release listed