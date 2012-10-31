Feature: Developer adds to user queue
  So that I can let users add to their queues outside of Netflix
  As a developer using the Netflix API
  I want to have a means to add to the user's queue

  Scenario: developer adds to user queue
    Given a working key
    And a working shared secret
    And an active user's account information
    And I retrieve the user's id and oauth tokens
    When I add Rounders to the user's queue
    Then Rounders should be in the queue
