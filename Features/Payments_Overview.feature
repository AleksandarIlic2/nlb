Feature: Payments_Overview


  @Payments_Payments_Overview_Display_Options_For_The_Selected_Account_[WEB]
  Scenario Outline: Payments_Payments_Overview_Display_Options_For_The_Selected_Account_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "Payments" from main sidebar

    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    #TODO sa userom koji ima upcoming otkomentarisati
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    #TODO sa userom koji ima payments sa savings account-om otkomentarisati
    And Select account from Excel "<rowindex>" columnName "savings_account_2_number" in Payments tab
    # And Click on element by containing text "Past payments"
    #And Assert payments in past payments have loaded
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    Examples:
      | rowindex |
      |        1 |