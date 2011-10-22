@wip
Feature: Planetary Movement

  As a player
  I want to see organisms moving on the planet
  So that I can monitor their ecosystem

  Scenario: A single organism should make a single movement

    Given I have started a game
    And there is an organism on the board
    When the planet ages 1 year
    Then it should not be where it started
    And it should be in a new location
