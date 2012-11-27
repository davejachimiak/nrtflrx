Feature: Developer requests catalog
  So that I can parse and get necessary information from it
  As a developer using the Netflix API
  I want to download Netflix's catalog

  Scenario: developer requests instant catalog
    Given a working key
    And a working shared secret
    When I submit an instant catalog request
    Then I successfully receive a catalog in xml format

  Scenario: developer requests instant catalog with a bad consumer key
    Given a bad working key
    And a working shared secret
    When I submit an instant catalog request
    Then the response is a bad consumer key exception object
