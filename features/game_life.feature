Feature: Lifetime of a game

  As a player
  I want to watch a planet age
  So that I can watch planetary movement over time

  Scenario: Age a planet by 10 years

    Given I have started a game
    When the planet ages 10 years
    Then the planet should be 10 years older
