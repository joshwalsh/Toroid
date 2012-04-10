@javascript
Feature: Time
  
  Scenario: Game ages a day
    Given the current year is 1
    And I visit the game page
    When I run the game for a year
    Then the current year should be 2

  Scenario: Log advancing time
    Given the current year is 1
    And a planet exists with attributes:
      | name   | Earth |
      | width  | 10    |
      | height | 10    |
    And I visit the game page
    When I run the game for a year