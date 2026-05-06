Feature: Own_Account_Transfer

  @Payments-Own_Account_Transfer-Flow_Disruption_Cancel-Back_[WEB]
  Scenario Outline: Payments-Own_Account_Transfer-Flow_Disruption_Cancel-Back_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Own account Transfer"
    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by containing text "Own account Transfer"
    And Wait for element by contains text " Own account Transfer "
    And Assert element by contains text " Own account Transfer "
    And Assert element by contains text " Check data and choose “Next” "

    And Wait for element by contains text "Debtor"
    And Assert element by contains text "Debtor"
    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_2_bban"
#    And Assert element by contains class "callout" have and index 0 have value from Excel "<rowindex>" columnName "current_account_2_name"
    And Assert element by tag "span" containing text "RSD" with index "1"
    
    And Assert element by contains text "Recipient"
    And Assert element by tag "nlb-account-selector" index "1"
    And Assert element by tag "span" containing text "RSD" with index "2"
    And Assert element by text " Payment "
    And Assert element by text " In order to continue all input fields must be filled. "
    
    Then Assert element by text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by tag "input" contains aria label "RSD"
    And Enter text "150" in field by contains id "amount-input"
    And Assert element by text "Purpose"
    And Assert element by text "Payment date"
    And Assert payment date is todays date and in valid date format in Own account transfer
    And Assert element by contains text "Cancel"
    And Assert element by contains text "Back"
    And Assert element by contains text "Next"

    And Click on element by containing text "Cancel"
    And Assert element by contains text "Are you sure?"
    And Assert element by contains text "Cancelling now will terminate the payment process."
    And Assert element by contains text "No"
    And Assert element by contains text "Yes"
    And Click on element by containing text "No"
    And Assert element by contains text "Own account Transfer"

    And Click on element by containing text "Cancel"
    And Assert element by contains text "Are you sure?"
    And Assert element by contains text "Cancelling now will terminate the payment process."
    And Assert element by contains text "No"
    And Assert element by contains text "Yes"
    And Click on element by containing text "Yes"
    And Wait for element by text "Currency exchange"

    And Click on element by containing text "Own account Transfer"
    And Wait for element by contains text "Own account Transfer"
    And Assert element by contains text "Own account Transfer"
    And Assert element by contains text "Check data and choose “Next”"

    And Assert element by contains text "Debtor"
    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_2_bban"
#    And Assert element by contains class "callout" have and index 0 have value from Excel "<rowindex>" columnName "current_account_2_name"
    And Assert element by tag "span" containing text "RSD" with index "1"

    And Assert element by contains text "Recipient"
    And Assert element by tag "nlb-account-selector" index "1"
    And Assert element by tag "span" containing text "RSD" with index "2"
    And Assert element by contains text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."

    Then Assert element by contains text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by tag "input" contains aria label "RSD"
    And Enter text "1" in field by contains id "amount-input"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "Payment date"
    And Assert payment date is todays date and in valid date format in Own account transfer
    And Assert element by contains text "Cancel"
    And Assert element by contains text "Back"
    And Assert element by contains text " Next "
    And Click on element by containing text " Next "
    And Wait for element by contains text "Payment amount"

    And Click on element by containing text "Cancel"
    And Assert element by contains text "Are you sure?"
    And Assert element by contains text "Cancelling now will terminate the payment process."
    And Assert element by contains text "No"
    And Assert element by contains text "Yes"
    And Click on element by containing text "No"
    And Wait for element by contains text "Payment amount"

    And Click on element by containing text "Cancel"
    And Assert element by contains text "Are you sure?"
    And Assert element by contains text "Cancelling now will terminate the payment process."
    And Assert element by contains text "No"
    And Assert element by contains text "Yes"
    And Click on element by containing text "Yes"
    And Wait for element by contains text "Currency exchange"
    And Assert element by contains text "Currency exchange"

    Examples:
      | rowindex |
      |        4 |


  @Payments-Own_Account_Transfer-From_Savings_Account_RSD_[WEB]-To_Savings_Account
  Scenario Outline: Payments-Own_Account_Transfer-From_Savings_Account_RSD_[WEB]-To_Savings_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Own account Transfer"
    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Own account Transfer"
    And Wait for element by text " Own account Transfer "
    And Assert element by text " Own account Transfer "
    And Assert element by text " Check data and choose “Next” "
    And Wait for element by contains text "Debtor"

    And Assert element by text " Debtor "
    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
#    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by tag "span" containing text "RSD" with index "1"
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "savings_account_1_number"

    And Assert element by contains text "Recipient"
    And Assert element by tag "nlb-account-selector" index "1"
    And Assert element by tag "span" containing text "RSD" with index "2"
    And Assert element by text " Payment "
    And Assert element by text " In order to continue all input fields must be filled. "
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "savings_account_2_number"

    Then Assert element by text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by tag "input" contains aria label "RSD"
    And Enter text "10" in field by contains id "amount-input"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert payment date is todays date and in valid date format in Own account transfer
    And Assert element by text "Cancel"
    And Assert element by text "Back"
    And Assert element by text " Next "

    And Click on element by text " Next "
    And Wait for element by text "Payment amount"
    And Assert element by text "Debtor"
    And Assert element by text "Recipient "
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner" is displayed
    #Odkomentarisi kada bude bio resen bug da se na drugom ekranu Own account transfera prikazuju validni brojevi racuna
#    And Assert saving account number with text from excel "<rowindex>" columnName "savings_account_1_number" become bban format
#    And Assert saving account number with text from excel "<rowindex>" columnName "savings_account_2_number" become bban format
#    And Assert element by text from excel "<rowindex>" columnName "savings_account_2_number" is displayed
    And Assert element by text "Payment"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Cancel"
    And Assert element by text "Back"
    And Assert element by text " Pay "
    And Click on element by text " Pay "
    And Assert element by contains text "Success"
    And Assert element by tag "div" containing text "Domestic payment"

    Examples:
      | rowindex |
      |        4 |


  @Payments-Own_Account_Transfer-From_Savings_Account_RSD_[WEB]-To_Current_Account
  Scenario Outline: Payments-Own_Account_Transfer-From_Savings_Account_RSD_[WEB]-To_Current_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Own account Transfer"
    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Own account Transfer"
    And Wait for element by text " Own account Transfer "
    And Assert element by text " Own account Transfer "
    And Assert element by text " Check data and choose “Next” "

    And Assert element by text " Debtor "
    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
#    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by tag "span" containing text "RSD" with index "1"
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "savings_account_1_number"

    And Assert element by contains text "Recipient"
    And Assert element by tag "nlb-account-selector" index "1"
    And Assert element by tag "span" containing text "RSD" with index "2"
    And Assert element by text " Payment "
    And Assert element by text " In order to continue all input fields must be filled. "
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_bban"

    Then Assert element by text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by tag "input" contains aria label "RSD"
    And Enter text "1" in field by contains id "amount-input"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert payment date is todays date and in valid date format in Own account transfer
    And Assert element by text "Cancel"
    And Assert element by text "Back"
    And Assert element by text " Next "

    And Click on element by text " Next "
    And Wait for element by text "Payment amount"
    And Assert element by text "Debtor"
    And Assert element by text "Recipient "
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner" is displayed
#    And Assert saving account number with text from excel "<rowindex>" columnName "savings_account_1_number" become bban format
#    And Assert saving account number with text from excel "<rowindex>" columnName "savings_account_2_number" become bban format
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Assert element by text "Payment"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Cancel"
    And Assert element by text "Back"
    And Assert element by text " Pay "
    And Click on element by text " Pay "
    And Assert element by contains text "Success"
    And Assert element by tag "div" containing text "Domestic payment"

    #TO DO:
    #Kada prorade placanja asertovati i balanse na racunima

    Examples:
      | rowindex |
      |        4 |


  @Payments-Own_Account_Transfer-From_Savings_Account_RSD_[WEB]-To_Charge_Card
  Scenario Outline: Payments-Own_Account_Transfer-From_Savings_Account_RSD_[WEB]-To_Charge_Card

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Own account Transfer"
    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Own account Transfer"
    And Wait for element by text " Own account Transfer "
    And Assert element by text " Own account Transfer "
    And Assert element by text " Check data and choose “Next” "

    And Wait for element by contains text "Debtor"
    And Assert element by text " Debtor "
    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
#    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by tag "span" containing text "RSD" with index "1"
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "savings_account_1_number"

    And Assert element by contains text "Recipient"
    And Assert element by tag "nlb-account-selector" index "1"
    And Assert element by tag "span" containing text "RSD" with index "2"
    And Assert element by text " Payment "
    And Assert element by text " In order to continue all input fields must be filled. "
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "credit_card_2_name"

    Then Assert element by text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by tag "input" contains aria label "RSD"
    And Enter text "0.1" in field by contains id "amount-input"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert payment date is todays date and in valid date format in Own account transfer
    And Assert element by text "Cancel"
    And Assert element by text "Back"
    And Assert element by text " Next "

    And Click on element by text " Next "
    And Wait for element by text "Payment amount"
    And Assert element by text "Debtor"
    And Assert element by text "Recipient "
    And Assert element by text from excel "<rowindex>" columnName "account_details_owner" is displayed
#    And Assert saving account number with text from excel "<rowindex>" columnName "savings_account_1_number" become bban format
#    And Assert saving account number with text from excel "<rowindex>" columnName "savings_account_2_number" become bban format
    And Assert element by contains text from excel "<rowindex>" columnName "credit_card_2_number" is displayed
    And Assert element by text "Payment"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Cancel"
    And Assert element by text "Back"
    And Assert element by text " Pay "
    And Click on element by text " Pay "
    And Assert element by contains text "Success"
    And Assert element by tag "div" containing text "Domestic payment"

    #TO DO:
    #Kada prorade placanja asertovati i balanse na racunima

    Examples:
      | rowindex |
      |        4 |


  @Payments-Own_Account_Transfer-From_Current_Account_RSD_[WEB]-To_Current_Account
  Scenario Outline: Payments-Own_Account_Transfer-From_Current_Account_RSD_[WEB]-To_Current_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_2_bban" under key "IT_001_Creditor_Balance"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Own account Transfer"
    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Own account Transfer"
    And Wait for element by text " Own account Transfer "
    And Assert element by text " Own account Transfer "
    And Assert element by text " Check data and choose “Next” "

    And Assert element by text " Debtor "
    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
#    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by tag "span" containing text "RSD" with index "1"
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"

    And Assert element by contains text "Recipient"
    And Assert element by tag "nlb-account-selector" index "1"
    And Assert element by tag "span" containing text "RSD" with index "2"
    And Assert element by text " Payment "
    And Assert element by text " In order to continue all input fields must be filled. "
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_bban"

    Then Assert element by text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by tag "input" contains aria label "RSD"
    And Enter text "1" in field by contains id "amount-input"
    And Assert element by text "Purpose"
    And Assert element by text "INTERNAL TRANSFER"
    And Assert element by text "Payment date"
    And Assert payment date is todays date and in valid date format in Own account transfer
    And Assert element by text "Cancel"
    And Assert element by text "Back"
    And Assert element by text " Next "

#    And Click on element by text " Next "
    And Click on button with type "submit"
    And Wait for element by text "Payment amount"
    And Assert Payment Amount in payment review is "1,00 RSD"
    And Assert "Fee" in payment review is "0,00 RSD"
    And Assert element by text "Debtor"
    And Assert element by contains text "Recipient"
#    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Assert element by contains text "Payment details"
    And Assert element by text "Purpose" has following sibling "dd" that contains text "INTERNAL TRANSFER"
    And Assert element by text "Value date"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Cancel"
    And Assert element by text "Back"
    And Click on button with descendant tag "div" contains text "Confirm"
    And Assert element by text "Success"
    And Assert element by contains class "nlb-icon icon-close"
    And Assert element by tag "div" containing text "Domestic payment"
    And Wait for "60" seconds
    And Click on tab "My Products" from main sidebar
    And Compare if current amount balance from key "IT_001_Debtor_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "1" is correct
    And Compare if current amount balance from key "IT_001_Creditor_Balance" in my products screen for account from Exlce "<rowindex>" columnName "current_account_2_bban" and added amount "1" is correct

    #TO DO:
    #@Personal-Account_to_Personal_Account-EUR-[WEB]
    #Ovo je slovenski test. Zavrsi test na slican nacin kada se balansi budu skidali i kada placanja budu isla u Past Payments

    Examples:
      | rowindex |
      |        2 |


  @Payments-Own_Account_Transfer-From_Current_Account_RSD_[WEB]-To_Savings_Account
  Scenario Outline: Payments-Own_Account_Transfer-From_Current_Account_RSD_[WEB]-To_Savings_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Own account Transfer"
    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Own account Transfer"
#    And Wait for element by contains text "Own account Transfer"
#    And Assert element by text "Own account Transfer"
    And Assert element by contains text "Check data and choose “Next”"

    And Wait for element by contains text "Debtor"
    And Assert element by contains text "Debtor"
    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert element by tag "span" containing text "RSD" with index "1"
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_bban"

    And Assert element by contains text "Recipient"
    And Assert element by tag "nlb-account-selector" index "1"
    And Assert element by tag "span" containing text "RSD" with index "2"
    And Assert element by contains text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "savings_account_1_number"

    Then Assert element by contains text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by tag "input" contains aria label "RSD"
    And Enter text "0,1" in field by contains id "amount-input"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "INTERNAL TRANSFER"
    And Assert element by contains text "Payment date"
#    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by contains text "Cancel"
    And Assert element by contains text "Back"
    And Assert element by text " Next "

    And Click on element by text " Next "
    And Wait for element by contains text "Payment amount"
    And Assert element by contains text "Debtor"
    And Assert element by contains text "Recipient"
#    And Assert contains text under key "fullNameKey" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
#    And Assert element by text from excel "<rowindex>" columnName "savings_account_2_number" is displayed
#    And Assert element by contains text "Payment"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "INTERNAL TRANSFER"
    And Assert element by contains text "Value date"
    And Assert value date is todays date and in valid date format in Payment review
    And Assert element by contains text "Cancel"
#    And Assert element by text "Back"
    And Assert element by contains text "Back"
#    And Assert element by contains text "Confirm"
    And Click on button with descendant tag "div" contains text "Confirm"
    And Assert element by text "Success"
    And Assert element by contains class "nlb-icon icon-close"
    And Assert element by tag "div" containing text "Domestic payment"

    #TO DO:
    #Kada prorade placanja asertovati i balanse na racunima

    Examples:
      | rowindex |
      |        1 |


  @Payments-Own_Account_Transfer-From_Current_Account_RSD_[WEB]-To_Charge_Card
  Scenario Outline: Payments-Own_Account_Transfer-From_Current_Account_RSD_[WEB]-To_Charge_Card

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Own account Transfer"
    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Own account Transfer"
#    And Wait for element by contains text "Own account Transfer"
#    And Assert element by text "Own account Transfer"
    And Assert element by contains text "Check data and choose “Next”"

    And Wait for element by contains text "Debtor"
    And Assert element by contains text "Debtor"
    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert element by tag "span" containing text "RSD" with index "1"
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_bban"

    And Assert element by contains text "Recipient"
    And Assert element by tag "nlb-account-selector" index "1"
    And Assert element by tag "span" containing text "RSD" with index "2"
    And Assert element by contains text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "credit_card_2_number"

    Then Assert element by contains text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by tag "input" contains aria label "RSD"
    And Enter text "0,1" in field by contains id "amount-input"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "INTERNAL TRANSFER"
    And Assert element by contains text "Payment date"
    And Assert payment date is todays date and in valid date format in Own account transfer
    And Assert element by contains text "Cancel"
    And Assert element by contains text "Back"
    And Assert element by text " Next "

    And Click on element by text " Next "
    And Wait for element by contains text "Payment amount"
    And Assert element by contains text "Debtor"
    And Assert element by contains text "Recipient"
    And Assert contains text under key "fullNameKey" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
#    And Assert element by text from excel "<rowindex>" columnName "savings_account_2_number" is displayed
#    And Assert element by contains text "Payment"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "INTERNAL TRANSFER"
    And Assert element by contains text "Value date"
    And Assert value date is todays date and in valid date format in Payment review
    And Assert element by contains text "Cancel"
#    And Assert element by text "Back"
    And Assert element by contains text "Back"
#    And Assert element by contains text "Pay"
    And Click on button with descendant tag "div" contains text "Confirm"
    And Assert element by text "Success"
    And Assert element by contains class "nlb-icon icon-close"
    And Assert element by tag "div" containing text "Domestic payment"

    #TO DO:
    #Kada prorade placanja asertovati i balanse na racunima

    Examples:
      | rowindex |
      |        4 |


  @Payments-Own_Account_Transfer-Invalid_Account_Combination_[WEB]
  Scenario Outline: Payments-Own_Account_Transfer-Invalid_Account_Combination_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Own account Transfer"
    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Own account Transfer"
    And Wait for element by text " Own account Transfer "
    And Assert element by text " Own account Transfer "
    And Assert element by text " Check data and choose “Next” "

    And Assert element by text " Debtor "
    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
#    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by tag "span" containing text "RSD" with index "1"
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"

    #current account
    Then Click on account selector with index "2"
    And Assert account name "Devizni platni račun" is not displayed
    And Assert account number containing "RS" is not displayed
    And Assert account number from Excel "<rowindex>" columnName "current_account_1_bban" is not displayed

    #saving account
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "savings_account_1_number"
    And Click on account selector with index "2"
    And Assert account name "Devizni platni račun" is not displayed
    And Assert account number containing "RS" is not displayed
    And Assert account number from Excel "<rowindex>" columnName "savings_account_1_number" is not displayed

    #current foreign
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_iban"
    And Click on account selector with index "2"
    And Assert account name "Tekući račun" is not displayed
    And Assert account number containing "205-" is not displayed
    And Assert account number from Excel "<rowindex>" columnName "current_account_1_iban" is not displayed
    And Assert account name "A vista" is not displayed
    And Assert account number containing "9011" is not displayed
    And Assert account name "Visa" is not displayed
    And Assert account number containing "****" is not displayed
    And Assert account name "kredit" is not displayed
    And Assert account number containing "00490" is not displayed

    #charge card
#    And Click on account selector with index "1"
#    And Click on element from Excel "<rowindex>" contains text columnName "credit_card_1_name"
#    And Click on account selector with index "2"
#    And Assert account name "Visa" is not displayed
#    And Assert account number containing "****" is not displayed
#    And Assert account number from Excel "<rowindex>" columnName "credit_card_1_number" is not displayed
#    And Assert account name "Visa" is not displayed
#    And Assert account number containing "****" is not displayed
#    And Assert account name "kredit" is not displayed
#    And Assert account number containing "00490" is not displayed
#    And Assert account name "Devizni platni račun" is not displayed
#    And Assert account number containing "RS" is not displayed
#
#    #loan
#    And Click on account selector with index "1"
#    And Assert account name "kredit" is not displayed
#    And Assert account number containing "00490" is not displayed
#
#    #credit card
#    And Assert account name "revolving" is not displayed

    Examples:
      | rowindex |
      |        4 |