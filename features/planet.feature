Feature: Planet

  Scenario: Create a new planet
    Given the current year is 1
    And I view the planets list page
    When I request a new planet
    And I fill in the new planet form with:
      | key     | value |
      | Name    | Mars  |
      | Width   | 5     |
      | Height  | 5     | 
    Then I should see a flash message: "The planet Mars was created"
    And I should be on the planet show page for the planet "Mars"

  Scenario: List all planets
    Given the current year is 1
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
    
  @wip
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

  @javascript
  Scenario: Game ages a day from the planet
    Given the current year is 1
    And a planet exists with attributes:
      | name   | Earth |
      | width  | 10    |
      | height | 10    |
    When the current year is 10
    And I view the page for that planet
    And I run the game for a year
    And I should see the planets age: "10"

  Scenario: Show organisms on planet
    Given the current year is 1
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
