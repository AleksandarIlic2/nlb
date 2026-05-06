Feature: Payments_Overview

  @Payments_Payments_Overview_Display_Options_For_The_Selected_Account_[WEB]
  Scenario Outline: Payments_Payments_Overview_Display_Options_For_The_Selected_Account_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Domestic payment"
    And Assert option buttons in Payments
    And Assert tag "nlb-account-selector" is displayed
    And Assert Upcoming payments and Past payments tabs is displayed
    And Assert Past payments tab is selected in Payments

    Then Click on tag "nlb-account-selector"
    And Assert accounts are sorted by account number priority and currency priority

    Examples:
      | rowindex |
      |        1 |


  @Payments-Payments_Overview_[WEB]
  Scenario Outline: Payments-Payments_Overview_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Domestic payment"
    And Assert option buttons in Payments
    And Assert tag "nlb-account-selector" is displayed
    And Assert Upcoming payments and Past payments tabs is displayed
    And Assert Past payments tab is selected in Payments

    Then Click on tag "nlb-account-selector"
    And Assert accounts are sorted by account number priority and currency priority

    Examples:
      | rowindex |
      |        2 |