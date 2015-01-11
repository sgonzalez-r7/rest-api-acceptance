Feature: Mdm::Workspace REST API

  As a customer
  I want to get Workspace data
  So that I can use it

  Background:
    Given the database has workspaces

  Scenario: Make a valid INDEX request
    When the client determines the correct workspaces path
    And  the client makes a GET request
    Then the status code is 200
    And  the response is JSON
    And  it returns all workspaces in the database

  Scenario: Make a valid SHOW request
    When the client determines the correct workspace path
    And  the client makes a GET request
    Then the status code is 200
    And  the response is JSON
    And  it returns the correct workspace in the database


  Scenario: INVALID SHOW request
    When the client choses an invalid workspace
    And  the client makes a GET request
    Then the status code is 404
