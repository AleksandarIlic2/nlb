Feature: Term_Deposits_Accounts

  @Term_Deposits-Accounts_Details[WEB]
  Scenario Outline: Term_Deposits-Accounts_Details[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Assert that products in my products have loaded

    When Wait for element by class "button-bold"
    And Assert element by class "button-bold"
    And Click on element by containing text from Excel "<rowindex>" columnName "term_deposits_2_account_number"
    And Wait for element by xPath "(//h3[contains(@class, 'heading-3')])[1]"
    And Assert element by contains text from excel "<rowindex>" columnName "term_deposits_2_account_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "term_deposit_2_name" is displayed
    And Assert element by xPath "(//div//nlb-amount)[1]" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"

    And Assert element by xPath "(//h3[contains(@class, 'heading-3')])[1]"
    And Assert label with text "Deposit amount" has value with text in format "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s[A-Z]{3}$"
    And Assert label with text "Interest rate" has value with text in format "^\d+,\d{4}%$"
    And Assert label with text "Accrued interests" has value with text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
    And Assert label with text "Pay out account" has value with text in format "^90\d{11}$"

    Then Assert element by xPath "(//h3[contains(@class, 'heading-3')])[2]"
    And Assert label with text "Account type" has value with text "Deposit"
    And Assert label with text "Account owner" has value with text under remembered key "fullNameKey"
    And Assert label with text "Account number" has value with text from Excel "<rowindex>" columnName "term_deposits_2_account_number"
    And Assert label with text "Opening date" has value with text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
    And Assert label with text "Expiration date" has value with text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
    And Assert element by text " Document archive "
    And Click on element by text " Document archive "
    And Assert element by text "Documents_DocumentsArchive_Title"

    Examples:
      | rowindex |
      |        1 |

  @Term_Deposits-Details_Account_Details_[WEB]
  Scenario Outline: Term_Deposits-Details_Account_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Assert that products in my products have loaded

#    When Wait for element by text "Edit list"
    When Wait for element by class "button-bold"
    And Assert element by class "button-bold"
    And Click on element by containing text from Excel "<rowindex>" columnName "term_deposits_1_account_number"
    And Wait for element by xPath "(//h3[contains(@class, 'heading-3')])[1]"
    And Assert element by contains text from excel "<rowindex>" columnName "term_deposits_1_account_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "term_deposit_1_name" is displayed
    And Assert element by xPath "(//div//nlb-amount)[1]" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"

    Then Assert element by xPath "(//h3[contains(@class, 'heading-3')])[1]"
    And Assert label with text "Account type" has value with text "Deposit"
    And Assert label with text "Account owner" has value with text under remembered key "fullNameKey"
    And Assert label with text "Account number" has value with text from Excel "<rowindex>" columnName "term_deposits_1_account_number"
    And Assert label with text "Opening date" has value with text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
    And Assert label with text "Expiration date" has value with text in format "^(0[1-9]|[12]\d|3[01])\.(0[1-9]|1[0-2])\.\d{4}$"
    And Assert element by text " Document archive "
    And Click on element by text " Document archive "
    And Assert element by text "Documents_DocumentsArchive_Title"

    Examples:
      | rowindex |
      |        1 |


  @Term_Deposits-Details-Financial_Details_[WEB]
  Scenario Outline: Term_Deposits-Details-Financial_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

#    When Wait for element by text "Edit list"
    When Wait for element by class "button-bold"
    And Assert element by class "button-bold"
    And Click on element by containing text from Excel "<rowindex>" columnName "term_deposits_2_account_number"
    And Wait for element by xPath "(//h3[contains(@class, 'heading-3')])[1]"
    And Assert element by contains text from excel "<rowindex>" columnName "term_deposits_2_account_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "term_deposit_2_name" is displayed
    And Assert element by xPath "(//div//nlb-amount)[1]" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"

    Then Assert element by xPath "(//h3[contains(@class, 'heading-3')])[1]"
    And Assert label with text "Deposit amount" has value with text in format "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s[A-Z]{3}$"
    And Assert label with text "Interest rate" has value with text in format "^\d+,\d{4}%$"
    And Assert label with text "Accrued interests" has value with text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
    And Assert label with text "Pay out account" has value with text in format "^90\d{11}$"
    
    And Assert element by xPath "(//h3[contains(@class, 'heading-3')])[2]"
    And Assert element by text " Document archive "

    Examples:
      | rowindex |
      |        1 |