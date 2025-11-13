Feature: Homepage

  @Homepage_Login
  Scenario Outline: Homepage_Login

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    Examples:
      | rowindex |
      |        1 |