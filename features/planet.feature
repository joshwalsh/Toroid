Feature: Planet

  Scenario: List all planets
    And a planet exists with attributes:
      | name   | Earth |
      | width  | 10    |
      | height | 10    |
    And a planet exists with attributes:
      | name   | Mars  |
      | width  | 20    |
      | height | 20    |
    And I view the planets list page
    Then I should see the planets name: "Earth"
    And I should see the planets name: "Mars"
    
  Scenario: Show details of planet
    Given the current year is 1
    And a planet exists with attributes:
      | name   | Earth |
      | width  | 10    |
      | height | 10    |
    When the current year is 10
    And I view the page for that planet
    Then I should see the planets name: "Earth"
    And I should see the planets birth year: "1"
    And I should see the planets age: "9"

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
    Then I should see a list of organisms:
      | name |
      | josh |
      | jon  |
