Feature: Mdm::Session REST API

  As a client
  I want to get Session data
  So that I can use it

  Background:
    Given a server with data

  Scenario: Successful INDEX request
    Given a host that exists
    And   the host belongs to a workspace
    When  client generates index path for sessions
    And   the client makes a GET#index request
    Then  the status code is 200
    And   the response is JSON
    And   it returns all sessions for the host
