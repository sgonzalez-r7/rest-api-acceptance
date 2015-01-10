Feature: Mdm::Workspace REST API

  As a customer
  I want to get Workspace data
  So that I can use it

  Scenario: get all workspaces
    Given the database has workspaces
    When I make an index get request
    Then I should receive status "200"
    And I should see all the workspaces
