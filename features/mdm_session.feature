Feature: Mdm::Session REST API

  As a client
  I want to get Session data
  So that I can use it

  Scenario: a valid index request
    Given a host that has sessions
    And   the host belongs to a workspace
    When  the client makes a GET#index request
    Then  the status code is 200
    And   it returns all sessions for the host

  Scenario: a valid show request
    Given a session that belongs to a host
    And   the host belongs to a workspace
    When  the client makes a GET#show request
    Then  the status code is 200
    And   it returns the session
