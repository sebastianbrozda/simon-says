Feature: Memory round

  Background:
    Given I started the game
    When Simon says "A,B,C"
    Then I should see "Simon says: A,B,C"

  Scenario: Successful memorization
    When I say "A,B,C"
    Then I should see "Correct. Now try to remember 4 commands."
    And I should see "Your score: 3"

  Scenario: Failed memorization
    When I say "A,B,X"
    Then I should see "Game over"
    And I should see "Your score: 2"

