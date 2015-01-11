Feature: Mdm::Workspace REST API

  As a customer
  I want to get Workspace data
  So that I can use it

  Background:
    Given the database has workspaces

  Scenario: valid index request
    When the client requests GET /workspaces
    Then the status code is 200
    And  the response is JSON
    And  it returns all workspaces in the database

  Scenario: valid show request
    When the client requests GET /workspaces/3
    Then the status code is 200
    And  the response is JSON
    And  it returns workspace with id 3

  Scenario: INVALID show request
    When the client requests GET /workspaces/999
    Then the status code is 404
