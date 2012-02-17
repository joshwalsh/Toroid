Feature: Planet

  Scenario: Show details of planet
    Given a planet exists with attributes:
      | name   | Earth |
      | width  | 10    |
      | height | 10    |
    When I view the page for that planet
    Then I should see the planets name: "Earth"

  Scenario: Show organisms on planet
    Given a planet exists with attributes:
      | name   | Earth |
      | width  | 10    |
      | height | 10    |
    And the planet has organisms with attributes:
      | name | x | y |
      | josh | 5 | 4 |
      | jon  | 3 | 8 |
    When I view the page for that planet
    Then I should see a visual representation of the planet
    And I should see a list of organisms:
      | name |
      | josh |
      | jon  |
