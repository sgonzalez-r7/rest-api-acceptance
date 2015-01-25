Feature: Mdm::Session REST API

  As a client
  I want to get Session data
  So that I can use it

  Scenario: Valid GET#index
    Given a host that has sessions
    And   the host belongs to a workspace
    When  the client makes a GET#index request
    Then  the status code is 200
    And   it returns all sessions for the host

  Scenario: GET#index with a host that does NOT exist
    Given a host that does NOT exist
    And   a workspace that exists
    When  the client makes a GET#index request
    Then  the status code is 404

  Scenario: GET#index with a workspace that does NOT exist
    Given a host that exists
    And   a workspace that does NOT exist
    When  the client makes a GET#index request
    Then  the status code is 404

  Scenario: Get#index with a host that does NOT belong to workspace
    Given a host that has sessions
    And   the host does NOT belong to a workspace
    When  the client makes a GET#index request
    Then  the status code is 404

  Scenario: Valid GET#show
    Given a session that belongs to a host
    And   the host belongs to a workspace
    When  the client makes a GET#show request
    Then  the status code is 200
    And   it returns the session
