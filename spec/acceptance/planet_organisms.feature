Feature: Planet Organisms

Scenario: List organisms on a planet
  Given a planet exists with attributes:
    | name   | Earth |
    | width  | 10    |
    | height | 10    | 
  And the planet has organisms with attributes:
    | name | x | y |
    | josh | 5 | 4 |
    | jon  | 3 | 8 |
  When I view the page with organisms scoped by planet
  Then I should see a list of organisms:
    | name |
    | josh |
    | jon  |
