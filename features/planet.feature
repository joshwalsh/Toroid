Feature: Planet

  Scenario: Show details of planet
    Given a planet exists with attributes:
      | name | Earth |
    When I view the page for that planet
    Then I should see the planets name: "Earth"

  Scenario: Show organisms on planet
    Given a planet exists with attributes:
      | name | Earth |
    And the planet has organisms with attributes:
      | name |
      | josh |
      | jon  |
    When I view the page for that planet
    Then I should see a list of organisms:
      | name |
      | josh |
      | jon  |
