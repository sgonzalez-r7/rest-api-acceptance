Feature: REST API Base Controller

  As a client
  I want to make sure I can access the REST API
  So that I can get data from it

  Scenario: valid token
    When the client generates the base path
    And  the client makes a GET request
    Then the status code is 200

  Scenario: invalid token
    When the client generates the base path
    And  the client uses an invalid token to ake a GET request
    Then the status code is 403
