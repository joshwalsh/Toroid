Feature: Organism Movement

  Scenario: A single organism should make a single movement
    Given the current year is 1
    And a planet exists with attributes:
      | name   | Earth |
      | width  | 10    |
      | height | 10    |
    And the planet has an organism with attributes:
      | name | x | y |
      | josh | 5 | 4 |
    And the system will navigate the organism to an adjacent cell at 5, 5
    When I visit the game page
    And I run the game for a year
    Then the organism should not be where it started
    And the organism should be moved to an adjacent cell
    And the time log should include "PLANET: Earth: ORGANISM: josh, moved from 5, 4 to 5, 5"
