Feature: Edit Release
	In order to update information about releases in the catalogue
	As an employee of this record label
	I want to edit a release

Background:
	Given I am a logged-in admin

Scenario: Update release information
	Given there is a release entitled "Endless Summer"
	When I change the title to "Venice"
	Then I should be on the release index page
	And I should see "Venice"