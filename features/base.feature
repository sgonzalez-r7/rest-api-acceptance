Feature: Base

  As a client
  I want to make a base request
  So that I can verify that I have access to the rest api

  Scenario: api key is valid
    Given a valid api key
    When  the client makes a base request
    Then  the status code is 200

  Scenario: api key is NOT valid
    Given an INVALID api key
    When  the client makes a base request
    Then  the status code is 403
