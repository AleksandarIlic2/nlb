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
    And Assert element by tag "div" containing text "Internal transfer"
#    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by containing text "Internal transfer"
    And Wait for element by contains text "Internal transfer"
    And Wait for "2" seconds
    And Assert element by contains text "Internal transfer"
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
#    And Assert element by tag "input" contains aria label "RSD"
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
    And Assert element by contains text "Internal transfer"

    And Click on element by containing text "Cancel"
    And Assert element by contains text "Are you sure?"
    And Assert element by contains text "Cancelling now will terminate the payment process."
    And Assert element by contains text "No"
    And Assert element by contains text "Yes"
    And Click on element by containing text "Yes"
    And Wait for element by text "Currency exchange"

    And Click on element by containing text "Internal transfer"
    And Wait for element by contains text "Internal transfer"
    And Assert element by contains text "Internal transfer"
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
#    And Assert element by tag "input" contains aria label "RSD"
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
    And Assert element by tag "div" containing text "Internal transfer"
#    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by containing text "Internal transfer"
    And Wait for "2" seconds
    And Wait for element by contains text "Internal transfer"
    And Assert element by contains text "Internal transfer"
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
    And Assert element by contains text "Payment details"
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
    And Assert element by tag "div" containing text "Internal transfer"
#    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Internal transfer"
    And Wait for "2" seconds
    And Wait for element by contains text "Internal transfer"
    And Assert element by contains text "Internal transfer"
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
    And Assert element by contains text "Payment details"
    And Assert element by text " In order to continue all input fields must be filled. "
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"

    Then Assert element by text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    #And Assert element by tag "input" contains aria label "RSD"
    And Assert element by contains class "auto body tw-text-gray-100" containing text "RSD"
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
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
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


#  @Payments-Own_Account_Transfer-From_Savings_Account_RSD_[WEB]-To_Charge_Card
#  Scenario Outline: Payments-Own_Account_Transfer-From_Savings_Account_RSD_[WEB]-To_Charge_Card
#
#    Given Open Login page
#    And Change language to English
#    And Login to the page using user from Excel "<rowindex>" columnName "username"
#    And Wait for element by text "Pay or transfer"
#
#    When Click on tab "Payments" from main sidebar
#    And Assert element by contains text "Pay or transfer"
#    And Assert account selector is displayed
#    And Assert element by tag "div" containing text "Domestic payment"
#    And Assert element by tag "div" containing text "Internal transfer"
##    And Assert element by tag "div" containing text "Foreign payment"
#    And Assert element by tag "div" containing text "Currency exchange"
#    And Assert element by tag "a" containing text "Upcoming payments"
#    And Assert element by tag "a" containing text "Past payments"
#
#    And Click on element by text "Internal transfer"
#    And Wait for "2" seconds
#    And Wait for element by contains text "Internal transfer"
#    And Assert element by contains text "Internal transfer"
#    And Assert element by text " Check data and choose “Next” "
#
#    And Wait for element by contains text "Debtor"
#    And Assert element by text " Debtor "
#    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
##    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_1_bban"
#    And Assert element by tag "span" containing text "RSD" with index "1"
#    And Click on account selector with index "1"
#    And Click on element from Excel "<rowindex>" contains text columnName "savings_account_1_number"
#
#    And Assert element by contains text "Recipient"
#    And Assert element by tag "nlb-account-selector" index "1"
#    And Assert element by tag "span" containing text "RSD" with index "2"
#    And Assert element by text " Payment "
#    And Assert element by text " In order to continue all input fields must be filled. "
#    And Click on account selector with index "2"
#    And Click on element from Excel "<rowindex>" contains text columnName "credit_card_2_name"
#
#    Then Assert element by text "Payment amount "
#    And Assert element by contains id "amount-input" is displayed
#    And Assert element by tag "input" contains aria label "RSD"
#    And Enter text "0.1" in field by contains id "amount-input"
#    And Assert element by text "Purpose"
#    And Assert element by text "INTERNAL TRANSFER"
#    And Assert element by text "Payment date"
#    And Assert payment date is todays date and in valid date format in Own account transfer
#    And Assert element by text "Cancel"
#    And Assert element by text "Back"
#    And Assert element by text " Next "
#
#    And Click on element by text " Next "
#    And Wait for element by text "Payment amount"
#    And Assert element by text "Debtor"
#    And Assert element by text "Recipient "
#    And Assert element by text from excel "<rowindex>" columnName "account_details_owner" is displayed
##    And Assert saving account number with text from excel "<rowindex>" columnName "savings_account_1_number" become bban format
##    And Assert saving account number with text from excel "<rowindex>" columnName "savings_account_2_number" become bban format
#    And Assert element by contains text from excel "<rowindex>" columnName "credit_card_2_number" is displayed
#    And Assert element by text "Payment"
#    And Assert element by text "Purpose"
#    And Assert element by text "INTERNAL TRANSFER"
#    And Assert element by text "Payment date"
#    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Cancel"
#    And Assert element by text "Back"
#    And Assert element by text " Pay "
#    And Click on element by text " Pay "
#    And Assert element by contains text "Success"
#    And Assert element by tag "div" containing text "Domestic payment"
#
#    #TO DO:
#    #Kada prorade placanja asertovati i balanse na racunima
#
#    Examples:
#      | rowindex |
#      |        4 |


  @Payments-Own_Account_Transfer-From_Current_Account_RSD_[WEB]-To_Current_Account
  Scenario Outline: Payments-Own_Account_Transfer-From_Current_Account_RSD_[WEB]-To_Current_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_3_bban" under key "IT_001_Creditor_Balance"
    
    #And Click on down arrow on first transaction do display details
    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Internal transfer"
#    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Internal transfer"
    And Wait for element by contains text "Debtor"
    And Assert element by contains text "Internal transfer"
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
    And Assert element by contains text "Payment details"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_3_bban"

    And Assert element by text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by class "tw-pr-2 tw-pl-2 tw-m-auto body tw-text-gray-100" containing text "RSD"
    And Enter text "5" in field by contains id "amount-input"
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
    And Assert Payment Amount in payment review is "5,00 RSD"
    And Assert "Fee" in payment review is "0,00 RSD"
    And Assert element by text "Debtor"
    And Assert element by contains text "Recipient"
#    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_3_bban" is displayed
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
#    And Wait for "60" seconds

    Then Click on tab "My Products" from main sidebar
    And Compare if current amount balance from key "IT_001_Debtor_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "1" is correct
    And Compare if current amount balance from key "IT_001_Creditor_Balance" in my products screen for account from Exlce "<rowindex>" columnName "current_account_3_bban" and added amount "1" is correct
    And Click on tab "Payments" from main sidebar
    And Assert element by tag "div" containing text "Payments"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    And Click on element by text "INTERNAL TRANSFER" index "2"
    And Assert that payment under name "INTERNAL TRANSFER" from txt file has today date
    And Wait for "2" seconds
#    And Assert that transaction amount in payment under key "INTERNAL TRANSFER" from txt file is "5,00"
    And Assert that transaction amount in payment under name "INTERNAL TRANSFER" from txt file is "5,00"
    And Assert that transaction currency in payment under name "INTERNAL TRANSFER" from text file is "RSD"
    And Assert that transaction "Creditor account" in opened past payment is from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert that transaction "Account number" in opened past payment is from Excel "<rowindex>" columnName "current_account_3_bban"
    And Assert that transaction "Name" in opened past payment contains text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert that transaction "Payment status" in opened past payment is "Executed"

    Examples:
      | rowindex |
      |        5 |


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
    And Assert element by tag "div" containing text "Internal transfer"
#    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Internal transfer"
    And Wait for "2" seconds
#    And Wait for element by contains text "Internal transfer"
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


#  @Payments-Own_Account_Transfer-From_Current_Account_RSD_[WEB]-To_Charge_Card
#  Scenario Outline: Payments-Own_Account_Transfer-From_Current_Account_RSD_[WEB]-To_Charge_Card
#
#    Given Open Login page
#    And Change language to English
#    And Login to the page using user from Excel "<rowindex>" columnName "username"
#    And Wait for element by text "Pay or transfer"
#    And Click on element by aria label "User profile"
#    And Remember full name of user from dashboard under key "fullNameKey"
#
#    When Click on tab "Payments" from main sidebar
#    And Assert element by contains text "Pay or transfer"
#    And Assert account selector is displayed
#    And Assert element by tag "div" containing text "Domestic payment"
#    And Assert element by tag "div" containing text "Internal transfer"
#    And Assert element by tag "div" containing text "Foreign payment"
#    And Assert element by tag "div" containing text "Currency exchange"
#    And Assert element by tag "a" containing text "Upcoming payments"
#    And Assert element by tag "a" containing text "Past payments"
#
#    And Click on element by text "Own account Transfer"
##    And Wait for element by contains text "Internal transfer"
##    And Assert element by text "Own account Transfer"
#    And Assert element by contains text "Check data and choose “Next”"
#
#    And Wait for element by contains text "Debtor"
#    And Assert element by contains text "Debtor"
#    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
#    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_2_bban"
#    And Assert element by tag "span" containing text "RSD" with index "1"
#    And Click on account selector with index "1"
#    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_bban"
#
#    And Assert element by contains text "Recipient"
#    And Assert element by tag "nlb-account-selector" index "1"
#    And Assert element by tag "span" containing text "RSD" with index "2"
#    And Assert element by contains text "Payment"
#    And Assert element by contains text "In order to continue all input fields must be filled."
#    And Click on account selector with index "2"
#    And Click on element from Excel "<rowindex>" contains text columnName "credit_card_2_number"
#
#    Then Assert element by contains text "Payment amount "
#    And Assert element by contains id "amount-input" is displayed
#    And Assert element by tag "input" contains aria label "RSD"
#    And Enter text "0,1" in field by contains id "amount-input"
#    And Assert element by contains text "Purpose"
#    And Assert element by contains text "INTERNAL TRANSFER"
#    And Assert element by contains text "Payment date"
#    And Assert payment date is todays date and in valid date format in Own account transfer
#    And Assert element by contains text "Cancel"
#    And Assert element by contains text "Back"
#    And Assert element by text " Next "
#
#    And Click on element by text " Next "
#    And Wait for element by contains text "Payment amount"
#    And Assert element by contains text "Debtor"
#    And Assert element by contains text "Recipient"
#    And Assert contains text under key "fullNameKey" is displayed
#    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
##    And Assert element by text from excel "<rowindex>" columnName "savings_account_2_number" is displayed
##    And Assert element by contains text "Payment"
#    And Assert element by contains text "Purpose"
#    And Assert element by contains text "INTERNAL TRANSFER"
#    And Assert element by contains text "Value date"
#    And Assert value date is todays date and in valid date format in Payment review
#    And Assert element by contains text "Cancel"
##    And Assert element by text "Back"
#    And Assert element by contains text "Back"
##    And Assert element by contains text "Pay"
#    And Click on button with descendant tag "div" contains text "Confirm"
#    And Assert element by text "Success"
#    And Assert element by contains class "nlb-icon icon-close"
#    And Assert element by tag "div" containing text "Domestic payment"
#
#    #TO DO:
#    #Kada prorade placanja asertovati i balanse na racunima
#
#    Examples:
#      | rowindex |
#      |        4 |


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
    And Assert element by tag "div" containing text "Internal transfer"
#    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Internal transfer"
    And Wait for element by contains text "Debtor"
    And Assert element by contains text "Internal transfer"
    And Assert element by text " Check data and choose “Next” "
    
    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
#    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by tag "span" containing text "RSD" with index "1"
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_bban"

    #current account
    Then Click on account selector with index "2"
    And Assert account name "Devizni platni račun" is not displayed
    And Assert account number containing "RS" is not displayed
    And Assert account number from Excel "<rowindex>" columnName "current_account_2_bban" is not displayed

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
      |        1 |


  @Payments-Own_Account_Transfer-From_Current_Account_RSD_To_Current_Account_RSD_[WEB]
  Scenario Outline: Payments-Own_Account_Transfer-From_Current_Account_RSD_To_Current_Account_RSD_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_3_bban" under key "IT_001_Creditor_Balance"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Internal transfer"
#    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Internal transfer"
    And Wait for element by contains text "Debtor"
    And Assert element by contains text "Internal transfer"
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
    And Assert element by contains text "Payment details"
    And Assert element by text " In order to continue all input fields must be filled. "
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_3_bban"

    And Assert element by text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by contains class "auto body tw-text-gray-100" containing text "RSD"
    #And Assert element by tag "input" contains aria label "RSD"
    And Enter text "5" in field by contains id "amount-input"
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
    And Assert Payment Amount in payment review is "5,00 RSD"
    And Assert "Fee" in payment review is "0,00 RSD"
    And Assert element by text "Debtor"
    And Assert element by contains text "Recipient"
#    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_3_bban" is displayed
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
    And Wait for "5" seconds

    Then Click on tab "My Products" from main sidebar
    And Compare if current amount balance from key "IT_001_Debtor_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "5" is correct
    And Compare if current amount balance from key "IT_001_Creditor_Balance" in my products screen for account from Exlce "<rowindex>" columnName "current_account_3_bban" and added amount "5" is correct
    And Click on tab "Payments" from main sidebar
    And Assert element by tag "div" containing text "Payments"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    And Click on element by text "INTERNAL TRANSFER" index "2"
    And Assert that payment under name "INTERNAL TRANSFER" from txt file has today date
    And Wait for "2" seconds
#    And Assert that transaction amount in payment under key "INTERNAL TRANSFER" from txt file is "5,00"
    And Assert that transaction amount in payment under name "INTERNAL TRANSFER" from txt file is "5,00"
    And Assert that transaction currency in payment under name "INTERNAL TRANSFER" from text file is "RSD"
    And Assert that transaction "Account number" in opened past payment is from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert that transaction "Recipient account number" in opened past payment is from Excel "<rowindex>" columnName "current_account_3_bban"
    And Assert that transaction "Name" in opened past payment contains text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert that transaction "Payment status" in opened past payment is "Executed"

    Examples:
      | rowindex |
      |        5 |

    # TODO test nije pustan , i nije dodat u execute fajl, takodje test treba prilagoditi za TST/UAT realnog korisnika
    # TODO i uraditi po upustsvima sa teamsa-a
  @Payments-Own_Account_Transfer-From_Current_Account_RSD_To_Current_Authorized_Account_RSD_[WEB]
  Scenario Outline: Payments-Own_Account_Transfer-From_Current_Account_RSD_To_Current_Account_RSD_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "auth_personal_account_number" under key "IT_001_Creditor_Balance"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Internal transfer"
#    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Internal transfer"
    And Wait for element by contains text "Debtor"
    And Assert element by contains text "Internal transfer"
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
    And Assert element by contains text "Payment details"
    And Assert element by text " In order to continue all input fields must be filled. "
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "auth_personal_account_number"

    And Assert element by text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by contains class "auto body tw-text-gray-100" containing text "RSD"
    #And Assert element by tag "input" contains aria label "RSD"
    And Enter text "5" in field by contains id "amount-input"
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
    And Assert Payment Amount in payment review is "5,00 RSD"
    And Assert "Fee" in payment review is "0,00 RSD"
    And Assert element by text "Debtor"
    And Assert element by contains text "Recipient"
#    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "auth_personal_account_number" is displayed
    And Assert element by contains text "Payment details"
    And Assert element by text "Purpose" has following sibling "dd" that contains text "INTERNAL TRANSFER"
    And Assert element by text "Value date"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Cancel"
    And Assert element by text "Back"
    And Click on button with descendant tag "div" contains text "Confirm"

    #TODO mobilna konfirmacija ubaciti
    And Assert element by text "Success"
    And Assert element by contains class "nlb-icon icon-close"
    And Assert element by tag "div" containing text "Domestic payment"
    And Wait for "5" seconds

    Then Click on tab "My Products" from main sidebar
    And Compare if current amount balance from key "IT_001_Debtor_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "5" is correct
    And Compare if current amount balance from key "IT_001_Creditor_Balance" in my products screen for account from Exlce "<rowindex>" columnName "auth_personal_account_number" and added amount "5" is correct
    And Click on tab "Payments" from main sidebar
    And Assert element by tag "div" containing text "Payments"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    And Click on element by text "INTERNAL TRANSFER" index "2"
    And Assert that payment under name "INTERNAL TRANSFER" from txt file has today date
    And Wait for "2" seconds
#    And Assert that transaction amount in payment under key "INTERNAL TRANSFER" from txt file is "5,00"
    And Assert that transaction amount in payment under name "INTERNAL TRANSFER" from txt file is "5,00"
    And Assert that transaction currency in payment under name "INTERNAL TRANSFER" from text file is "RSD"
    And Assert that transaction "Account number" in opened past payment is from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert that transaction "Recipient account number" in opened past payment is from Excel "<rowindex>" columnName "current_account_3_bban"
    And Assert that transaction "Name" in opened past payment contains text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert that transaction "Payment status" in opened past payment is "Executed"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Own_Account_Transfer-To_Card_[WEB]-From_Current_Domestic_Account
  Scenario Outline: Payments-Own_Account_Transfer-To_Card_[WEB]-From_Current_Domestic_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_2_bban" under key "IT_001_Debtor_Balance"
    And Remember available balance for account from Excel "<rowindex>" columnName "credit_card_1_number" under key "IT_001_Creditor_Balance"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Internal transfer"
#    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Internal transfer"
    And Wait for element by contains text "Internal transfer"
    And Assert element by contains text "Internal transfer"
    And Assert element by text " Check data and choose “Next” "

    And Assert element by text " Debtor "
    And Assert element by xPath "//*[contains(@src, 'CurrentAccount-Icon')]" and index 0 is displayed
#    And Assert element by contains class "accountItemDescription" have and index 0 have value from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by tag "span" containing text "RSD" with index "1"
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_bban"

    And Assert element by contains text "Recipient"
    And Assert element by tag "nlb-account-selector" index "1"
    And Assert element by tag "span" containing text "RSD" with index "2"
    And Assert element by text " Payment "
    And Assert element by text " In order to continue all input fields must be filled. "
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "credit_card_1_number"

    And Assert element by text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by tag "input" contains aria label "RSD"
    And Enter text "5" in field by contains id "amount-input"
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
    And Assert Payment Amount in payment review is "5,00 RSD"
    And Assert "Fee" in payment review is "0,00 RSD"
    And Assert element by text "Debtor"
    And Assert element by contains text "Recipient"
#    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "credit_card_1_number" is displayed
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
#    And Wait for "60" seconds

    Then Click on tab "My Products" from main sidebar
    And Compare if current amount balance from key "IT_001_Debtor_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_2_bban" and reduced amount "5" is correct
    And Compare if current amount balance from key "IT_001_Creditor_Balance" in my products screen for account from Exlce "<rowindex>" columnName "credit_card_1_number" and added amount "5" is correct
    And Click on tab "Payments" from main sidebar
    And Assert element by tag "div" containing text "Payments"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    And Click on element by text "INTERNAL TRANSFER" index "2"
    And Assert that payment under name "INTERNAL TRANSFER" from txt file has today date
    And Wait for "2" seconds
#    And Assert that transaction amount in payment under key "INTERNAL TRANSFER" from txt file is "5,00"
    And Assert that transaction amount in payment under name "INTERNAL TRANSFER" from txt file is "5,00"
    And Assert that transaction currency in payment under name "INTERNAL TRANSFER" from text file is "RSD"
    And Assert that transaction "Creditor account" in opened past payment is from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert that transaction "Account number" in opened past payment is from Excel "<rowindex>" columnName "credit_card_1_number"
    And Assert that transaction "Name" in opened past payment contains text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert that transaction "Payment status" in opened past payment is "Executed"

    Examples:
      | rowindex |
      |        4 |


  @Payments-Own_Account_Transfer-To_Card_[WEB]-From_Savings_Account
  Scenario Outline: Payments-Own_Account_Transfer-To_Card_[WEB]-From_Savings_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
#    And Remember current balance for account from Excel "<rowindex>" columnName "savings_account_1_number" under key "IT_001_Debtor_Balance"
    And Remember current balance for saving account from Excel "<rowindex>" columnName "savings_account_1_number" under key "IT_001_Debtor_Balance"
    And Remember available balance for account from Excel "<rowindex>" columnName "credit_card_1_number" under key "IT_001_Creditor_Balance"

    When Click on tab "Payments" from main sidebar
    And Assert element by contains text "Pay or transfer"
    And Assert account selector is displayed
    And Assert element by tag "div" containing text "Domestic payment"
    And Assert element by tag "div" containing text "Internal transfer"
#    And Assert element by tag "div" containing text "Foreign payment"
    And Assert element by tag "div" containing text "Currency exchange"
    And Assert element by tag "a" containing text "Upcoming payments"
    And Assert element by tag "a" containing text "Past payments"

    And Click on element by text "Internal transfer"
    And Wait for element by contains text "Internal transfer"
    And Assert element by contains text "Internal transfer"
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
    And Click on element from Excel "<rowindex>" contains text columnName "credit_card_1_number"

    And Assert element by text "Payment amount "
    And Assert element by contains id "amount-input" is displayed
    And Assert element by tag "input" contains aria label "RSD"
    And Enter text "5" in field by contains id "amount-input"
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
    And Assert Payment Amount in payment review is "5,00 RSD"
    And Assert "Fee" in payment review is "0,00 RSD"
    And Assert element by text "Debtor"
    And Assert element by contains text "Recipient"
#    And Assert element by text from excel "<rowindex>" columnName "account_details_owner2" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "savings_account_1_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "credit_card_1_number" is displayed
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
#    And Wait for "60" seconds

    Then Click on tab "My Products" from main sidebar
    And Compare if current amount balance from key "IT_001_Debtor_Balance" in my products screen for account from Excel "<rowindex>" columnName "savings_account_1_number" and reduced amount "5" is correct
    And Compare if current amount balance from key "IT_001_Creditor_Balance" in my products screen for account from Exlce "<rowindex>" columnName "credit_card_1_number" and added amount "5" is correct
    And Click on tab "Payments" from main sidebar
    And Assert element by tag "div" containing text "Payments"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    And Click on element by text "INTERNAL TRANSFER" index "2"
    And Assert that payment under name "INTERNAL TRANSFER" from txt file has today date
    And Wait for "2" seconds
#    And Assert that transaction amount in payment under key "INTERNAL TRANSFER" from txt file is "5,00"
    And Assert that transaction amount in payment under name "INTERNAL TRANSFER" from txt file is "5,00"
    And Assert that transaction currency in payment under name "INTERNAL TRANSFER" from text file is "RSD"
    And Assert that transaction "Creditor account" in opened past payment is from Excel "<rowindex>" columnName "savings_account_1_number"
    And Assert that transaction "Account number" in opened past payment is from Excel "<rowindex>" columnName "credit_card_1_number"
    And Assert that transaction "Name" in opened past payment contains text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert that transaction "Payment status" in opened past payment is "Executed"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Own_Account_Transfer_To_Loan_[WEB]-From_Current_Domestic_Account
  Scenario Outline: Payments_Own_Account_Transfer_To_Loan_[WEB]-From_Current_Domestic_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    When Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"
    And Remember available balance for account from Excel "<rowindex>" columnName "loan_account_1_number" under key "key_IT_001_Loan_Balance"

    And Click on tab "Payments" from main sidebar
    And Wait for element by text "Domestic payment"
    And Click on normalized text "Internal transfer"
    And Wait for element by contains text "Debtor"

    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "loan_account_1_number"

    And Enter text "3" in "Payment amount" input field and remember under key "keyPaymentAmount"
    And Assert element by tag "span" containing text "RSD" with index "2"
    And Assert element with attribute "src" contains value "RSD" is displayed
    And Assert element by text "Purpose" has following sibling "div" that contains text "INTERNAL TRANSFER"
    And Assert payment date is todays date and in valid date format in Own account transfer

    And Assert element by contains text "Next"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on normalized text "Next"

    And Wait for element by contains text "Fee"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert element by text "Fee" has following sibling "span" that contains text "0,00 RSD"

    And Assert element by normalized text "Debtor"
    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_short"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by normalized text "Recipient"
    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    #And Assert element by text "Address" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_short"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "loan_account_1_number"

    And Assert element by normalized text "Payment details"
    And Assert element by text "Purpose" has following sibling "dd" that contains text "INTERNAL TRANSFER"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on normalized text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "3.00" and currency "RSD" with message "Success"
    And Wait for element by text "Success"
    And Assert element by contains text "Success"

    And Wait for "2" seconds
    And Refresh page
    And Wait for first past payment

    And Assert latest past payment has purpose "INTERNAL TRANSFER"
    And Assert last payment in past payments has value from remembered key "keyPaymentAmount"
    And Click on first Executed past payment
    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyDebtorFullName"
    And Assert label "Recipient account number" in payment confirmation contains value from excel "<rowindex>" columnName "loan_account_1_number"
    And Assert field "Purpose code" in payment confirmation has text "N"
    And Assert field "Purpose" in payment confirmation has text "INTERNAL TRANSFER"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"

    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert label "Name" in payment confirmation contains value under remembered key "keyDebtorFullName"
    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    And Assert field "Fee" in payment confirmation contains text "0,00"
    And Assert field "Fee" in payment confirmation contains text "RSD"
    And Assert field "Payment status" in payment confirmation has text "Executed"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load

    Then Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "3" is correct
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "3" is correct
    And Compare if available amount balance from key "key_IT_001_Loan_Balance" in my products screen for account from Excel "<rowindex>" columnName "loan_account_1_number" and added amount "0" is correct

    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that purpose for first transaction in product screen is "INTERNAL TRANSFER"

    And Assert that first transaction is "outgoing"
    And Click on down arrow on first transaction do display details
    And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "loan_account_1_number"
    And Assert element by text "Amount" has following sibling "dd" with regex "\d+,\d{2}\s*RSD"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Own_Account_Transfer_To_Loan_[WEB]-From_Savings_Account
  Scenario Outline: Payments_Own_Account_Transfer_To_Loan_[WEB]-From_Savings_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    When Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember current balance for account from Excel "<rowindex>" columnName "savings_account_1_number" under key "key_IT_001_Debtor_Current_Balance"
    And Remember available balance for account from Excel "<rowindex>" columnName "loan_account_1_number" under key "key_IT_001_Loan_Balance"

    And Click on tab "Payments" from main sidebar
    And Wait for element by text "Domestic payment"
    And Click on normalized text "Internal transfer"
    And Wait for element by contains text "Debtor"

    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "savings_account_1_number"
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "loan_account_1_number"

    And Enter text "3" in "Payment amount" input field and remember under key "keyPaymentAmount"
    And Assert element by tag "span" containing text "RSD" with index "2"
    And Assert element with attribute "src" contains value "RSD" is displayed
    And Assert element by text "Purpose" has following sibling "div" that contains text "INTERNAL TRANSFER"
    And Assert payment date is todays date and in valid date format in Own account transfer

    And Assert element by contains text "Next"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on normalized text "Next"

    And Wait for element by contains text "Fee"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert element by text "Fee" has following sibling "span" that contains text "0,00 RSD"

    And Assert element by normalized text "Debtor"
    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_short"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "savings_account_1_number"

    And Assert element by normalized text "Recipient"
    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    #And Assert element by text "Address" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_short"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "loan_account_1_number"

    And Assert element by normalized text "Payment details"
    And Assert element by text "Purpose" has following sibling "dd" that contains text "INTERNAL TRANSFER"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on normalized text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "savings_account_1_number" amount "3.00" and currency "RSD" with message "Success"
    And Wait for element by text "Success"
    And Assert element by contains text "Success"

    And Wait for "2" seconds
    And Refresh page
    And Wait for first past payment

    And Assert latest past payment has purpose "INTERNAL TRANSFER"
    And Assert last payment in past payments has value from remembered key "keyPaymentAmount"
    And Click on first Executed past payment
    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyDebtorFullName"
    And Assert label "Recipient account number" in payment confirmation contains value from excel "<rowindex>" columnName "loan_account_1_number"
    And Assert field "Purpose code" in payment confirmation has text "N"
    And Assert field "Purpose" in payment confirmation has text "INTERNAL TRANSFER"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"

    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert label "Name" in payment confirmation contains value under remembered key "keyDebtorFullName"
    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "savings_account_1_number"
    And Assert field "Fee" in payment confirmation contains text "0,00"
    And Assert field "Fee" in payment confirmation contains text "RSD"
    And Assert field "Payment status" in payment confirmation has text "Executed"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load

    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "savings_account_1_number" and reduced amount "3" is correct
    And Compare if available amount balance from key "key_IT_001_Loan_Balance" in my products screen for account from Excel "<rowindex>" columnName "loan_account_1_number" and added amount "0" is correct

    And Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Wait for first transaction in Product details
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that purpose for first transaction in product screen is "INTERNAL TRANSFER"

    And Assert that first transaction is "outgoing"
    And Click on down arrow on first transaction do display details
    And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "loan_account_1_number"
    And Assert element by text "Amount" has following sibling "dd" with regex "\d+,\d{2}\s*RSD"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Own_Account_Transfer_From_Current_Foreign_Account_To_Current_Foreign_Account_[WEB]
  Scenario Outline: Payments_Own_Account_Transfer_From_Current_Foreign_Account_To_Current_Foreign_Account_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    When Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_2_iban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_2_iban" under key "key_IT_001_Debtor_Current_Balance"
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_iban" under key "key_IT_001_Recipient_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_iban" under key "key_IT_001_Recipient_Current_Balance"

    And Click on tab "Payments" from main sidebar
    And Wait for element by text "Domestic payment"
    And Click on normalized text "Internal transfer"
    And Wait for element by contains text "Debtor"

    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_iban"
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_iban"

    And Enter text "2" in "Payment amount" input field and remember under key "keyPaymentAmount"
    And Assert element by tag "span" containing text "EUR" with index "2"
    And Assert element with attribute "src" contains value "EUR" is displayed
    And Assert element by text "Purpose" has following sibling "div" that contains text "INTERNAL TRANSFER"
    And Assert payment date is todays date and in valid date format in Own account transfer

    And Assert element by contains text "Next"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on normalized text "Next"

    And Wait for element by contains text "Fee"
#    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert payment amount under key is "keyPaymentAmount" for currency "EUR" is displayed

    And Assert element by text "Fee" has following sibling "span" that contains text "0,00 EUR"

    And Assert element by normalized text "Debtor"
    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_short"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_2_iban"

    And Assert element by normalized text "Recipient"
    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "user_address_for_payment_review"
    #And Assert element by text "Address" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_short"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_iban"

    And Assert element by normalized text "Payment details"
    And Assert element by text "Purpose" has following sibling "dd" that contains text "INTERNAL TRANSFER"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on normalized text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_2_iban" amount from key "keyReducedAmount" and currency "EUR" with message "Success"
    And Wait for element by text "Success"
    And Assert element by contains text "Success"
    And Click on account selector with index "1"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"

    And Wait for first past payment
    And Wait for "2" seconds
    And Refresh page

    And Assert latest past payment has purpose "INTERNAL TRANSFER"
    And Assert last payment in past payments has value from remembered key "keyPaymentAmount"
    And Click on first Executed past payment
    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyDebtorFullName"
#    And Assert label "Recipient account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_iban"
    And Assert field "Purpose code" in payment confirmation has text "N"
    And Assert field "Purpose" in payment confirmation has text "INTERNAL TRANSFER"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"

    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert label "Name" in payment confirmation contains value under remembered key "keyDebtorFullName"
#    And Assert label "Debtor account" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_2_bban"
    And Assert field "Fee" in payment confirmation contains text "0,00"
    And Assert field "Fee" in payment confirmation contains text "EUR"
    And Assert field "Payment status" in payment confirmation has text "Executed"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load

    Then Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_2_iban" and reduced amount "2" is correct
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_2_iban" and reduced amount "2" is correct
    And Compare if current amount balance from key "key_IT_001_Recipient_Current_Balance" in my products screen for account from Exlce "<rowindex>" columnName "current_account_1_iban" and added amount "2" is correct
    And Compare if available amount balance from key "key_IT_001_Recipient_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_iban" and added amount "2" is correct

    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Wait for first transaction in Product details
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that purpose for first transaction in product screen is "INTERNAL TRANSFER"

    And Assert that first transaction is "outgoing"
    And Click on down arrow on first transaction do display details
#    And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "current_account_3_iban"
    And Assert element by text "Amount" has following sibling "dd" with regex "\d+,\d{2}\s*EUR"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "EUR"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load

    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for first transaction in Product details
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that purpose for first transaction in product screen is "INTERNAL TRANSFER"

    And Assert that first transaction is "incoming"
    And Click on down arrow on first transaction do display details
#    And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "current_account_3_iban"
    And Assert element by text "Amount" has following sibling "dd" with regex "\d+,\d{2}\s*EUR"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "EUR"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |

