Feature: Mdm::Workspace REST API

  As a customer
  I want to get Workspace data
  So that I can use it

  Background:
    Given the database has workspaces

  Scenario: Make a valid INDEX request
    When the client generates the workspaces path
    And  the client makes a GET request
    Then the status code is 200
    And  the response is JSON
    And  it returns all workspaces in the database

  Scenario: Make a valid SHOW request
    When the client uses a valid workspace id
    And  the client generates the workspace path
    And  the client makes a GET request
    Then the status code is 200
    And  the response is JSON
    And  it returns the correct workspace in the database


  Scenario: Make a SHOW request with INVALID ID
    When the client uses an invalid workspace id
    And  the client generates the workspace path
    And  the client makes a GET request
    Then the status code is 404
