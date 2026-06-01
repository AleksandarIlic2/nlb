Feature: Upcoming_Payments

  @Payments-Upcoming_Payments-List_Of_Transactions_[WEB]
  Scenario Outline: Payments-Upcoming_Payments-List_Of_Transactions_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Upcoming payments"
    And Wait for "5" seconds
    And Click on element by containing text "Upcoming payments"
    And Assert payments in past payments have loaded

#    Then Assert icons for Upcoming payments are displayed
    And Assert dates of Upcoming payments are displayed correctly
    And Assert list of elements by xPath "//h5" are displayed
    And Assert list of creditor names of Upcoming payments are displayed
    And Assert list of amounts with currencies of Upcoming payments are displayed correctly

    Examples:
      | rowindex |
      |        2 |