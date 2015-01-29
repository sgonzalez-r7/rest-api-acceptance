Feature: Mdm::Workspace REST API

  As a client
  I want to get Workspace data
  So that I can use it

#
# GET#index
#
  Scenario: Valid GET#index
    When  the client makes a GET#index request for workspaces
    Then  the status code is 200
    And   it returns all workspaces

#
# GET#show
#
  Scenario: Valid GET#show
    Given a workspace that exists
    When  the client makes a GET#show request for workspace
    Then  the status code is 200
    And   it returns the workspace

  Scenario: Valid GET#show
    Given a workspace that does NOT exist
    When  the client makes a GET#show request for workspace
    Then  the status code is 404
