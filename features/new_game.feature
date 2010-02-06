Feature: Starting a new game

  As a player
  I want to have a planet
  So that I have something to interact with

  Scenario:

    Given I have not started a game
    When I start a game
    Then I should have an empty planet

    Given I have started a game
    When I add an organism to the planet
    Then it should exist on the planet

    Given I have started a game
    When I populate the planet
    Then I should have a planet with organisms
