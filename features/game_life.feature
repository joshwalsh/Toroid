Feature: Lifetime of a game

  As a player
  I want to watch a planet age
  So that I can watch planetary movement over time

  @wip
  Scenario: Age a planet by 10 days

    Given I have started a game
    When the planet ages 10 days
    Then the planet should be 10 days older
