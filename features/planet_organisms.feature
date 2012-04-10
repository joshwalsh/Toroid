Feature: Planet Organisms

  @javascript
  @wip
  Scenario: List organisms on a planet
    Given the current year is 1
    And a planet exists with attributes:
      | name   | Earth |
      | width  | 10    |
      | height | 10    |
    And the planet has organisms with attributes:
      | name | x | y |
      | josh | 5 | 4 |
    And I view the page for that planet
    Then I should see organisms on the grid:
      | name | x | y |
      | josh | 5 | 4 |
