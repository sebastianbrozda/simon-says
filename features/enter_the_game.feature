Feature: Enter the game

  Background:
    Given I am not yet playing
    When I start a new game

  Scenario: Allow enter the game
    When I enter the game as "sebastian"
    Then I should see "Nice to meet you, sebastian, lets play..."

  Scenario: Prohibiting entry to the game
    When I don't write username
    Then I should see "I don't play with anonymous, bye"
