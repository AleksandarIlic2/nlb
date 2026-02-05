Feature: Saving_Accounts

  @Savings_Accounts_Details-Financial_Details_[WEB]
  Scenario Outline: Savings_Accounts_Details-Financial_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_name"
    And Assert element by contains text "Transactions"
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert Transactions tab is selected by default
    And Assert element by contains text "Download"
    And Assert element by xPath "//*[contains(@class, 'wrap tw-items')]" is displayed
    And Assert element by text " Filters" is displayed
    
    Then Click on element by text "Details"
#    TO DO sledeca metoda:
#    And Assert sections are displayed in order:
#      | Financial details |
#      | Account details   |
#    TO DO: Labele u sekciji Financial details

    Examples:
    | rowindex |
    |        1 |


  @Savings_Accounts_Details-Account_Details_[WEB]
  Scenario Outline: Savings_Accounts_Details-Account_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Assert element by contains text "Transactions"
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert Transactions tab is selected by default
    And Assert element by contains text "Download"
    And Assert element by xPath "//*[contains(@class, 'wrap tw-items')]" is displayed
    And Assert element by text " Filters" is displayed

    Then Click on element by text "Details"
#    TO DO sledeca metoda:
#    And Assert sections are displayed in order:
#      | Financial details |
#      | Account details   |

    And Assert Account type is displayed correctly in Account details for Savings account
    And Assert Account owner in Savings Account details is from Excel "<rowindex>" columnName "username"
    #TO DO: Odkomentarisati korak za Account number kada rese bug sa brojem partije u hederu i skeciji
#    And Assert Account number in Savings Account details is from Excel "<rowindex>" columnName "savings_account_1_number"
    And Assert Purpose is displayed correctly in Account details for Savings account
    And Assert Opening date is displayed correctly in Account details for Savings account
    And Assert element by text " Document archive " is displayed
    #And Click on element by text " Document archive "
    #And Assert element by text "Documents archive" is displayed


    Examples:
      | rowindex |
      |        1 |