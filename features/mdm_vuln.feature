Feature: Mdm::Vuln REST API

  As a client
  I want to get vuln data
  So that I can use it

#
# GET#index
#
  Scenario: Valid GET#index
    Given a workspace that has a host
    And   the host has a service
    And   the service has vulns
    When  the client makes a GET#index request for vulns
    Then  the status code is 200
    And   it returns all vulns for the service

  Scenario: GET#index with a workspace that does NOT exist
    Given a workspace that does NOT exist
    And   a host that has a service
    And   the service has vulns
    When  the client makes a GET#index request for vulns
    Then  the status code is 404

  Scenario: GET#index with a host that does NOT exist
    Given a workspace that exists
    And   a host that does NOT exist
    And   a service that has vulns
    When  the client makes a GET#index request for vulns
    Then  the status code is 404

  Scenario: Get#index with a host that does NOT belong to a workspace
    Given a host that does NOT belong to a workspace
    And   the host has a service
    And   the service has vulns
    When  the client makes a GET#index request for vulns
    Then  the status code is 404

  Scenario: Get#index with a service that does NOT belong to a host
    Given a workspace that has a host
    And   a service that does NOT belong to the host
    And   the service has vulns
    When  the client makes a GET#index request for vulns
    Then  the status code is 404

#
# GET#show

  Scenario: Valid GET#show
    Given a workspace that has a host
    And   the host has a service
    And   the service has a vuln
    When  the client makes a GET#show request for vuln
    Then  the status code is 200
    And   it returns the vuln

  Scenario: GET#show with a workspace that does NOT exist
    Given a workspace that does NOT exist
    And   a host that has a service
    And   the service has a vuln
    When  the client makes a GET#show request for vuln
    Then  the status code is 404

  Scenario: GET#show with a host that does NOT exist
    Given a workspace that exists
    And   a host that does NOT exist
    And   a service that has a vuln
    When  the client makes a GET#show request for vuln
    Then  the status code is 404

  Scenario: GET#show with a service that does NOT exist
    Given a workspace that has a host
    And   a service that does NOT exist
    And   a vuln that exists
    When  the client makes a GET#show request for vuln
    Then  the status code is 404

  Scenario: GET#show with a host that does NOT belong to a workspace
    Given a host that does NOT belong to a workspace
    And   the host has a service
    And   the service has a vuln
    When  the client makes a GET#show request for vuln
    Then  the status code is 404

  Scenario: GET#show with a service that does NOT belong to a host
    Given a workspace that has a host
    And   a service that does NOT belong to the host
    And   the service has a vuln
    When  the client makes a GET#show request for vuln
    Then  the status code is 404

  Scenario: GET#show with a vuln that does NOT belong to a service
    Given a workspace that has a host
    And   the host has a service
    And   a vuln that does NOT belong to the service
    When  the client makes a GET#show request for vuln
    Then  the status code is 404
