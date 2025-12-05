Feature: Foreign_Current_Account

  @Foreign_Current_Account_Product_Details_Account_Details_[WEB]
  Scenario Outline: Foreign_Current_Account_Product_Details_Account_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    When Wait for element by text "Pay or transfer"

    And Click on element by containing text from Excel "<rowindex>" columnName "personal_account_name1"
    And Click on element by text "Details"

    #And Scroll screen down
    And Assert element by text "Account details" index "2" is displayed
    And Assert element by tag "nlb-icon" and attribute "name" with value "icon-copy"
    And Assert that element "Account type" has value "Current account"
    And Assert that element "BIC" has value "KOBBRSBG"
    And Assert that element "Account owner" is equal to value from Excel "<rowindex>" columnName "username"
    And Assert that element "Account number" is equal to value from Excel "<rowindex>" columnName "personal_account_number2"



    Examples:
      | rowindex |
      |        1 |

  @Foreign_Current_Accounts-Transactions-Filter_By_Type_[WEB]
  Scenario Outline: Foreign_Current_Accounts-Transactions-Filter_By_Type_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "personal_account_iban"
    And Wait for element by tag "nlb-product-detail-header"
    Then Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert order of tabs in tablist
    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker
    #Incoming
    And Scroll screen down
    #And Assert radio button by text "All"
    And Select radio button by text "Incoming transactions"
    And Click on element by text " Confirm "
    And Assert there are only "Incoming transactions" transactions in transactions list
    And Assert transaction dates are ordered correctly
      #TODO: OVO ENAIBLE KAD BUDE NOVI RELEASE
        # And Assert Assert there are only Incoming transactions by icon
    And Click on element by text " Clear filters "
    And Click on element by text " Filters"
    And Assert date picker
    And Scroll screen down
    And Select radio button by text "Outgoing transactions"
    And Click on element by text " Confirm "
    And Assert there are only "Outgoing transactions" transactions in transactions list
    And Assert transaction dates are ordered correctly

    And Click on element by text " Clear filters "
    Examples:
      | rowindex |
      |        2 |
