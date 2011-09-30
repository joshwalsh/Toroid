Feature: Planetary Movement

  As a player
  I want to see organisms moving on the planet
  So that I can monitor their ecosystem

  Scenario: A single organism should make a single movement

    Given I have started a game
    And there is an organism on the board
    When it is able to move
    Then it should move
