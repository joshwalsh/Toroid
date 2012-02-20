Feature: Time
  
  Scenario: Game ages a day
    Given the current year is 1
    When I visit the game page
    And I run the game for a year
    Then the current year should be 2
