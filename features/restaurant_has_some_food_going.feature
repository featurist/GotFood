@javascript
Feature: Restaurant has some food going...

  Scenario: Notifying people there is some food available
    Given Mario has 3 Pizzas left over
    And Tony is a hungry person
    When he announces those pizzas
    Then a hungry person can get those pizzas

