Feature: Mdm::Host REST API

  As a client
  I want to get Host data
  So that I can use it

#
# GET#index
#
  Scenario: Valid GET#index
    Given a workspace that has hosts
    When  the client makes a GET#index request for hosts
    Then  the status code is 200
    And   it returns all hosts for the workspace

  Scenario: GET#index with a workspace that does NOT exist
    Given a workspace that does NOT exist
    And   a host that exists
    When  the client makes a GET#index request for hosts
    Then  the status code is 404

#
# GET#show
#
  Scenario: Valid GET#show
    Given a workspace that has a host
    When  the client makes a GET#show request for host
    Then  the status code is 200
    And   it returns the host

  Scenario: GET#show with a workspace that does NOT exist
    Given a workspace that does NOT exist
    And   a host that exists
    When  the client makes a GET#show request for host
    Then  the status code is 404

  Scenario: GET#show with a host that does NOT exist
    Given a workspace that exists
    And   a host that does NOT exist
    When  the client makes a GET#show request for host
    Then  the status code is 404

  Scenario: GET#show with a host that does NOT belong to a workspace
    Given a host that does NOT belong to a workspace
    When  the client makes a GET#show request for host
    Then  the status code is 404
