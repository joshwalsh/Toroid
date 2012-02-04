Feature: Planet
  Scenario: Show details of planet
    Given a planet exists with attributes:
      | name | Earth |
    When I view the page for that planet
    Then I should see the planets name: "Earth"
