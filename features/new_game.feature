Feature: Starting a new game

  As a player
  I want to have a planet
  So that I have something to interact with

  Scenario: Create empty planet

    Given I have not started a game
    When I start a game
    Then I should have an empty planet

  Scenario: Create planet with one organism

    Given I have started a game
    When I add an organism to the planet
    Then it should exist on the planet

  Scenario: Create planet with multiple organisms

    Given I have started a game
    When I populate the planet
    Then I should have a planet with organisms
