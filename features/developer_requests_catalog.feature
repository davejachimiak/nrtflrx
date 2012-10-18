Feature: Developer requests catalog
  So that I can parse and get necessary information from it
  As a developer using the Netflix API
  I want to download Netflix's catalog

  Scenario: developer requests catalog
    Given a working key
    And   a working shared secret
    When  I submit a catalog request
    Then  I successfully receive a catalog in xml format
