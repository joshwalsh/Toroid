Feature: Organism Movement

  @time
  @organisms
  @log
  @planet
  @javascript
  Scenario: A single organism should make a single movement
    Given the current year is 1
    And a planet exists with attributes:
      | name   | Earth |
      | width  | 10    |
      | height | 10    |
    And the planet has an organism with attributes:
      | name | x | y |
      | josh | 5 | 4 |
    And the system will navigate the organism at 5, 4 to 5, 5
    And I visit the game page
    When I run the game for a year