@javascript
Feature: Time
  
  Scenario: Game ages a day
    Given the current year is 1
    When I run the game for a year
    Then the current year should be 2

  @log 
  @planet
  Scenario: Log advancing time
    Given the current year is 1
    And a planet exists with attributes:
      | name   | Earth |
      | width  | 10    |
      | height | 10    |
    When I run the game for a year
    And I visit the game logs
    Then the time log should include "TIME: Year 2"
    Then the time log should include "PLANET: Earth: Age 1"
