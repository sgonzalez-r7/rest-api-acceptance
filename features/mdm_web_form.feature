Feature: Mdm::WebForm REST API

  As a client
  I want to get web_form data
  So that I can use it

#
# GET#index
#
  Scenario: Valid GET#index
    Given a workspace that has a host
    And   the host has a service
    And   the service has a web_site
    And   the web_site has web_forms
    When  the client makes a GET#index request for web_forms
    Then  the status code is 200
    And   it returns all web_forms for the web_site

  Scenario: GET#index with a workspace that does NOT exist
    Given a workspace that does NOT exist
    And   a host that has a service
    And   the service has a web_site
    And   the web_site has web_forms
    When  the client makes a GET#index request for web_forms
    Then  the status code is 404

  Scenario: GET#index with a host that does NOT exist
    Given a workspace that exists
    And   a host that does NOT exist
    And   a service that has a web_site
    And   the web_site has web_forms
    When  the client makes a GET#index request for web_forms
    Then  the status code is 404

  Scenario: GET#index with a service that does NOT exist
    Given a workspace that has a host
    And   a service that does NOT exist
    And   a web_site that has web_forms
    When  the client makes a GET#index request for web_forms
    Then  the status code is 404

  Scenario: Get#index with a host that does NOT belong to a workspace
    Given a host that does NOT belong to a workspace
    And   the host has a service
    And   the service has a web_site
    And   the web_site has web_forms
    When  the client makes a GET#index request for web_forms
    Then  the status code is 404

  Scenario: Get#index with a service that does NOT belong to a host
    Given a workspace that has a host
    And   a service that does NOT belong to the host
    And   the service has a web_site
    And   the web_site has web_forms
    When  the client makes a GET#index request for web_forms
    Then  the status code is 404

  Scenario: Get#index with a web_site that does NOT belong to a service
    Given a workspace that has a host
    And   the host has a service
    And   a web_site that does NOT belong to a service
    And   the web_site has web_forms
    When  the client makes a GET#index request for web_forms
    Then  the status code is 404

#
# GET#show
#
  Scenario: Valid GET#show
    Given a workspace that has a host
    And   the host has a service
    And   the service has a web_site
    And   the web_site has a web_form
    When  the client makes a GET#show request for web_form
    Then  the status code is 200
    And   it returns the web_form

  Scenario: GET#show with a workspace that does NOT exist
    Given a workspace that does NOT exist
    And   a host that has a service
    And   the service has a web_site
    And   the web_site has a web_form
    When  the client makes a GET#show request for web_form
    Then  the status code is 404

  Scenario: GET#show with a host that does NOT exist
    Given a workspace that exists
    And   a host that does NOT exist
    And   a service that has a web_site
    And   the web_site has a web_form
    When  the client makes a GET#show request for web_form
    Then  the status code is 404

  Scenario: GET#show with a service that does NOT exist
    Given a workspace that has a host
    And   a service that does NOT exist
    And   a web_site that exists
    And   the web_site has a web_form
    When  the client makes a GET#show request for web_form
    Then  the status code is 404

  Scenario: GET#show with a host that does NOT belong to a workspace
    Given a host that does NOT belong to a workspace
    And   the host has a service
    And   the service has a web_site
    And   the web_site has a web_form
    When  the client makes a GET#show request for web_form
    Then  the status code is 404

  Scenario: GET#show with a service that does NOT belong to a host
    Given a workspace that has a host
    And   a service that does NOT belong to the host
    And   the service has a web_site
    And   the web_site has a web_form
    When  the client makes a GET#show request for web_form
    Then  the status code is 404

  Scenario: GET#show with a web_site that does NOT belong to a service
    Given a workspace that has a host
    And   the host has a service
    And   a web_site that does NOT belong to the service
    And   the web_site has a web_form
    When  the client makes a GET#show request for web_form
    Then  the status code is 404
