Feature: Mdm::Session REST API

  As a client
  I want to get Session data
  So that I can use it

  Scenario: a successful index request
    Given the client finds a host that has sessions
    And   the host belongs to a workspace
    When  the client generates the index path for sessions
    And   the client makes a GET#index request
    Then  the status code is 200
    And   the response is JSON
    And   it returns all sessions for the host

