Feature: Render a Planet

	As a player
	I want to render the planet
	So that I can examine the state of the planet
	
	Scenario: Render empty planet
		Given I have a small empty planet
		When I render the planet
		Then I should see:
			|. . .|
			|. . .|
			|. . .|

  Scenario: Render populated planet
		Given I have a small planet
		When I render the planet
		Then I should see:
			|. . .|
			|. x .|
			|. . x|
