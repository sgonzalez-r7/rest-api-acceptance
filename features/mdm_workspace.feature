Feature: Mdm::Workspace REST API

  As a customer
  I want to get Workspace data
  So that I can use it

  Background:
    Given the database has workspaces

  Scenario:
    When the client requests GET /workspaces
    Then the status code is 200
