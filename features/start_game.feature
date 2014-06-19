Feature: Start game
  As a user
  I want to star a game
  So that I can check my memory

  Scenario: start game
    Given I am not yet playing
    When I start a new game
    Then I should see "Welcome to Simon Says"
    And I should see "Please, enter your name:"