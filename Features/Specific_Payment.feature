Feature: Specific_Payment


  @Payments_Specific_Payment_Credit_Card_Repayment_[WEB]-From_Current_Domestic_Account
  Scenario Outline: Payments_Specific_Payment_Credit_Card_Repayment_[WEB]-From_Current_Domestic_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Check if cash credit offer appears upon login and if it is dismiss it
    And Wait for element by text "Balance"
    And Click on tab "My Products" from main sidebar
    And Assert that products in my products have loaded

    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"
    And Remember available balance for account from Excel "<rowindex>" columnName "credit_card_2_number" under key "key_Card_Balance"
    
    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for first transaction in Product details
    And Click on element by containing text "Details"
    And Wait for element by contains text "Credit card repayment"
    And Click on element by containing text "Credit card repayment"
    And Wait for element by contains text "In order to continue all input fields must be filled."

    And Assert element by contains text "Internal transfer"
    And Assert element by contains text "Debtor"
    And Click on account selector with index "1"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by contains text "Recipient"
    And Click on account selector with index "2"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"

    And Assert element by contains text "Payment details"
    And Assert element by contains text "Payment amount"
    And Enter text "1" in "Payment amount" input field and remember under key "keyPaymentAmount"
    And Assert element with text "Purpose" with following sibling has text "INTERNAL TRANSFER"
    And Assert payment date is todays date and in valid date format in Own account transfer
    And Click on normalized text "Next"
    And Wait for element by contains text "Fee"

    #payment review
    And Assert payment amount in payment review is from key "keyPaymentAmount" and currency "RSD"
    And Assert element with text "Fee" with following sibling has text "0,00 RSD"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "account_details_owner2"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by text "Name" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "account_details_owner2"
    #And Assert element by text "Address" and index "2" has first following sibling that contains text from key "keyAddress"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Assert element with text "Purpose" with following sibling has text "INTERNAL TRANSFER"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by normalized text "Cancel"
    And Assert element by normalized text "Back"
    And Click on button with type "submit"

    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "1.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"
    And Wait for element by contains text "Statements"

    #past payments
    And Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Click on tag "nlb-account-selector"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for "2" seconds
    And Refresh page
    And Wait for first past payment

    And Assert latest past payment has purpose "INTERNAL TRANSFER"
    And Assert last payment in past payments has value from remembered key "keyPaymentAmount"
    And Click on first Executed past payment
    #And Assert label "Recipient account number" in payment confirmation contains value from excel "<rowindex>" columnName "credit_card_2_number"
    And Assert field "Purpose" in payment confirmation has text "INTERNAL TRANSFER"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert label "Name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner2"
    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    And Assert field "Fee" in payment confirmation contains text "0,00"
    And Assert field "Fee" in payment confirmation contains text "RSD"
    And Assert field "Payment status" in payment confirmation has text "Executed"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount from key "keyPaymentAmount" is correct
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount from key "keyPaymentAmount" is correct
    And Compare if available amount balance from key "key_Card_Balance" in my products screen for account from Excel "<rowindex>" columnName "credit_card_2_number" and reduced amount "0" is correct

    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that purpose for first transaction in product screen is "INTERNAL TRANSFER"
    And Click on down arrow on first transaction do display details
    And Wait for "1" seconds
    #And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "loan_account_1_number"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for first transaction in Product details
    And Assert that first transaction is "incoming"
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that purpose for first transaction in product screen is "INTERNAL TRANSFER"
    And Click on down arrow on first transaction do display details
    And Wait for "1" seconds
    #And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "loan_account_1_number"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Description" has following sibling "dd" that contains text "INTERNAL TRANSFER"
    And Assert element by text "Amount in local currency" has following sibling "dd" that contains text from key "keyPaymentAmount"
    And Assert element by text "Authorization date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Settlement date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        1 |

  # Nakon submit-a pre payment review - izlazi greska - 'Not-possible-transfer-between-accounts'
  @Payments_Specific_Payment_Credit_Card_Repayment_[WEB]-From_Savings_Account
  Scenario Outline: Payments_Specific_Payment_Credit_Card_Repayment_[WEB]-From_Savings_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Check if cash credit offer appears upon login and if it is dismiss it
    And Wait for element by text "Balance"
    And Click on tab "My Products" from main sidebar
    And Assert that products in my products have loaded

    And Remember available balance for account from Excel "<rowindex>" columnName "savings_account_1_number" under key "key_IT_001_Debtor_Available_Balance"
    And Remember available balance for account from Excel "<rowindex>" columnName "credit_card_2_number" under key "key_Card_Balance"

    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for first transaction in Product details
    And Click on element by containing text "Details"
    And Wait for element by contains text "Credit card repayment"
    And Click on element by containing text "Credit card repayment"
    And Wait for element by contains text "In order to continue all input fields must be filled."

    And Assert element by contains text "Internal transfer"
    And Assert element by contains text "Debtor"
    And Click on account selector with index "1"
    And Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Assert element by contains text "Recipient"
    And Click on account selector with index "2"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"

    And Assert element by contains text "Payment details"
    And Assert element by contains text "Payment amount"
    And Enter text "1" in "Payment amount" input field and remember under key "keyPaymentAmount"
    And Assert element with text "Purpose" with following sibling has text "INTERNAL TRANSFER"
    And Assert payment date is todays date and in valid date format in Own account transfer
    And Click on normalized text "Next"
    And Wait for element by contains text "Fee"

    #payment review
    And Assert payment amount in payment review is from key "keyPaymentAmount" and currency "RSD"
    And Assert element with text "Fee" with following sibling has text "0,00 RSD"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "account_details_owner2"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Assert element by text "Name" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "account_details_owner2"
     #And Assert element by text "Address" and index "2" has first following sibling that contains text from key "keyAddress"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Assert element with text "Purpose" with following sibling has text "INTERNAL TRANSFER"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by normalized text "Cancel"
    And Assert element by normalized text "Back"
    And Click on button with type "submit"

    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "savings_account_1_number" amount "1.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"
    And Wait for element by contains text "Statements"

    #past payments
    And Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Click on tag "nlb-account-selector"
    And Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Wait for "2" seconds
    And Refresh page
    And Wait for first past payment

    And Assert latest past payment has purpose "INTERNAL TRANSFER"
    And Assert last payment in past payments has value from remembered key "keyPaymentAmount"
    And Click on first Executed past payment
    #And Assert label "Recipient account number" in payment confirmation contains value from excel "<rowindex>" columnName "credit_card_2_number"
    And Assert field "Purpose" in payment confirmation has text "INTERNAL TRANSFER"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert label "Name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner2"
    #And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "savings_account_1_number"
    And Assert field "Fee" in payment confirmation contains text "0,00"
    And Assert field "Fee" in payment confirmation contains text "RSD"
    And Assert field "Payment status" in payment confirmation has text "Executed"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "savings_account_1_number" and reduced amount from key "keyPaymentAmount" is correct
    And Compare if available amount balance from key "key_Card_Balance" in my products screen for account from Excel "<rowindex>" columnName "credit_card_2_number" and reduced amount "0" is correct

    And Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Wait for first transaction in Product details
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that purpose for first transaction in product screen is "INTERNAL TRANSFER"
    And Click on down arrow on first transaction do display details
    And Wait for "1" seconds
    #And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "loan_account_1_number"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for first transaction in Product details
    And Assert that first transaction is "incoming"
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that purpose for first transaction in product screen is "INTERNAL TRANSFER"
    And Click on down arrow on first transaction do display details
    And Wait for "1" seconds
    #And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "loan_account_1_number"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Description" has following sibling "dd" that contains text "INTERNAL TRANSFER"
    And Assert element by text "Amount in local currency" has following sibling "dd" that contains text from key "keyPaymentAmount"
    And Assert element by text "Authorization date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Settlement date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        1 |