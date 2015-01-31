Feature: Mdm::Note REST API

  As a client
  I want to get note data
  So that I can use it

#
# GET#index
#
  Scenario: Valid GET#index
    Given a workspace that has a host
    And   the host has notes
    When  the client makes a GET#index request for notes
    Then  the status code is 200
    And   it returns all notes for the host

  Scenario: GET#index with a workspace that does NOT exist
    Given a workspace that does NOT exist
    And   a host that has notes
    When  the client makes a GET#index request for notes
    Then  the status code is 404

  Scenario: GET#index with a host that does NOT exist
    Given a workspace that exists
    And   a host that does NOT exist
    When  the client makes a GET#index request for notes
    Then  the status code is 404

  Scenario: Get#index with a host that does NOT belong to a workspace
    Given a host that does NOT belong to a workspace
    And   the host has notes
    When  the client makes a GET#index request for notes
    Then  the status code is 404

#
# GET#show
#
  Scenario: Valid GET#show
    Given a workspace that has a host
    And   the host has a note
    When  the client makes a GET#show request for note
    Then  the status code is 200
    And   it returns the note

  Scenario: GET#show with a workspace that does NOT exist
    Given a workspace that does NOT exist
    And   a host that has a note
    When  the client makes a GET#show request for note
    Then  the status code is 404

  Scenario: GET#show with a host that does NOT exist
    Given a workspace that exists
    And   a host that does NOT exist
    And   a note that exists
    When  the client makes a GET#show request for note
    Then  the status code is 404

  Scenario: GET#show with a note that does NOT exist
    Given a workspace that has a host
    And   a note that does NOT exist
    When  the client makes a GET#show request for note
    Then  the status code is 404

  Scenario: GET#show with a host that does NOT belong to a workspace
    Given a host that does NOT belong to a workspace
    And   the host has a note
    When  the client makes a GET#show request for note
    Then  the status code is 404

  Scenario: GET#show with a note that does NOT belong to a host
    Given a workspace that has a host
    And   a note that does NOT belong to the host
    When  the client makes a GET#show request for note
    Then  the status code is 404
