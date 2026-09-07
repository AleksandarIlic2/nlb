Feature: Payments_Archive

  @Payments-Payments_Archive-Filter_Payments_By_Date_[WEB]
  Scenario Outline: Payments-Payments_Archive-Filter_Payments_By_Date_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Domestic payment"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    And Click on element by id "filters-header"

    And Assert element by text "Date range"
    And Assert element by contains class "icon-calendar-today" with index "1"
    And Assert element by contains class "icon-calendar-today" with index "2"
    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"
    And Assert element by contains text "From"
    And Assert element by contains text "To"

    And Assert element by contains text "Amount"
    And Assert element by contains text "From"
    And Assert element by contains text "To"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "1"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "2"
    And Assert NLB button "Confirm"
    And Assert NLB button "Clear filters"

    Then Click on element by containing class "icon-calendar-today" with index "1"
    And Select date in From label to be "28.04.2026"
    And Select date in To label to be "30.04.2026"
    And Click on NLB button "Confirm"
    And Wait for first past payment
    And Assert transaction dates in Past payments are between "28.04.2026" and "30.04.2026"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Payments_Archive_Filter_Payments_By_Amount-Invalid_[WEB]
  Scenario Outline: Payments_Payments_Archive_Filter_Payments_By_Amount-Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Domestic payment"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    And Click on element by id "filters-header"

    And Assert element by text "Date range"
    And Assert element by contains class "icon-calendar-today" with index "1"
    And Assert element by contains class "icon-calendar-today" with index "2"
    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"
    And Assert element by contains text "From"
    And Assert element by contains text "To"

    And Assert element by contains text "Amount"
    And Assert element by contains text "From"
    And Assert element by contains text "To"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "1"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "2"
    And Assert NLB button "Confirm"
    And Assert NLB button "Clear filters"

    Then Enter text "100" in field by xPath "(//label[contains(text(),'From')]//following-sibling::div/input)[1]"
    And Enter text "50" in field by xPath "(//label[contains(text(),'To')]//following-sibling::div/input)[1]"
#    And Assert element by contains text "From amount must be smaller than To amount."
    And Assert element by contains text "ValidationError"

    Examples:
      | rowindex |
      |        1 |


  @Payments_Payments_Archive_Filter_Payments_By_Status_[WEB]
  Scenario Outline: Payments_Payments_Archive_Filter_Payments_By_Status_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Domestic payment"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    And Click on element by id "filters-header"

    And Assert element by text "Date range"
    And Assert element by contains class "icon-calendar-today" with index "1"
    And Assert element by contains class "icon-calendar-today" with index "2"
    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"
    And Assert element by contains text "From"
    And Assert element by contains text "To"

    And Assert element by contains text "Amount"
    And Assert element by contains text "From"
    And Assert element by contains text "To"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "1"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "2"
    And Assert NLB button "Confirm"
    And Assert NLB button "Clear filters"

    And Click on element by containing text "Executed"
    And Click on NLB button "Confirm"
    And Assert transaction status in Past payments are Executed

    And Click on element by containing text "Executed"
    And Click on element by containing text "Rejected"
    And Click on element by containing text "Confirm"
#    And Assert transaction status in Past payments are Rejected

    And Click on element by containing text "Executed"
    And Click on NLB button "Confirm"
    And Assert transaction status in Past payments are Executed or Rejected

    Examples:
      | rowindex |
      |        4 |


  @Payments_Payments_Archive-Create_Confirmation_[WEB]
  Scenario Outline: Payments_Payments_Archive-Create_Confirmation_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Domestic payment"
    And Click on element by containing text "Past payments"
    And Wait for "1" seconds
    And Wait for element by tag "nlb-payments"

    And Click on tag "nlb-account-selector"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Enter text "Internal" into input field
    And Wait for "1" seconds
    And Assert payments in past payments have loaded

    Then Remember all transaction values from executed past payment in map
    And Click on element by text "Confirmation"
    And Assert document with name starting with "Potvrda" and has file type ".pdf" is downloaded
    And Assert that Executed past payment transaction values in PDF match remembered values from remembered map

    Examples:
      | rowindex |
      |        5 |


  @Payments_Payments_Archive-Payments_List_[WEB]
  Scenario Outline: Payments_Payments_Archive-Payments_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Past payments"
    And Wait for "2" seconds
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded

#    Then Assert icons for Upcoming payments are displayed
    And Assert dates of Payments archive are displayed correctly
    And Assert list of elements by xPath "//h5" are displayed
    And Assert list of creditor names of Payments archive are displayed
#    And Assert list of amounts with currencies of Upcoming payments are displayed correctly

    And Click on element by xpath "//nlb-account-selector"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Assert dates of Payments archive are displayed correctly
    And Assert list of elements by xPath "//h5" are displayed
    And Assert list of creditor names of Payments archive are displayed
#    And Assert list of amounts with currencies of Upcoming payments are displayed correctly

    Then Click on element by xpath "//nlb-account-selector"
    And Click on element from Excel "<rowindex>" contains text columnName "savings_account_1_number"
    And Assert dates of Payments archive are displayed correctly
    And Assert list of elements by xPath "//h5" are displayed
    And Assert list of creditor names of Payments archive are displayed
#    And Assert list of amounts with currencies of Upcoming payments are displayed correctly

    Examples:
      | rowindex |
      |        1 |


  @Payments_Payments_Archive_Payments_Details_[WEB]
  Scenario Outline: Payments_Payments_Archive_Payments_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Wait for first past payment
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Wait for "2" seconds
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for "2" seconds
    And Click on first Executed past payment
    And Wait for element by contains text "Confirmation"

    And Assert element by contains text "Confirmation"
    And Assert element by contains text "Repeat payment"
    And Assert field "Recipient" in payment confirmation matches regex "^.+$"
    And Assert field "Recipient address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Recipient account" in payment confirmation matches regex "^\d{3}-\d{13}-\d{2}$"
    And Assert field "Urgent payment" in payment confirmation matches regex "^(Yes|No)$"
    And Assert field "Purpose code" in payment confirmation matches regex "^\d{3}$"
    And Assert field "Purpose" in payment confirmation matches regex "^.+$"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert field "Order ID" in payment confirmation matches regex "^.{14}$"
    And Assert label "Debtor name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner"
    And Assert label "Debtor account" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    And Assert field "Debtor address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Fee" in payment confirmation matches regex "^\d{1,2},\d{2}\s*RSD$"
    And Assert field "Payment status" in payment confirmation contains text "Executed"

    And Click on element by containing class "icon-chevron-down" with index "1"
    And Wait for "2" seconds
    And Click on element by containing text from Excel "<rowindex>" columnName "auth_current_account_bban"
    And Wait for "2" seconds
    And Click on first Executed past payment
    And Wait for element by contains text "Confirmation"

    And Assert element by contains text "Confirmation"
    And Assert element by contains text "Repeat payment"
    And Assert field "Recipient" in payment confirmation matches regex "^.+$"
    And Assert field "Recipient address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Recipient account" in payment confirmation matches regex "^\d{3}-\d{13}-\d{2}$"
    And Assert field "Urgent payment" in payment confirmation matches regex "^(Yes|No)$"
    And Assert field "Purpose code" in payment confirmation matches regex "^\d{3}$"
    And Assert field "Purpose" in payment confirmation matches regex "^.+$"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert field "Order ID" in payment confirmation matches regex "^.{14}$"
    And Assert label "Debtor name" in payment confirmation contains value from excel "<rowindex>" columnName "auth_current_account_owner_name"
    And Assert label "Debtor account" in payment confirmation contains value from excel "<rowindex>" columnName "auth_current_account_bban"
    And Assert field "Debtor address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Fee" in payment confirmation matches regex "^\d{1,2},\d{2}\s*RSD$"
    And Assert field "Payment status" in payment confirmation contains text "Executed"

    And Click on element by containing class "icon-chevron-down" with index "1"
    And Wait for "2" seconds
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for "2" seconds
    And Click on first Executed past payment
    And Wait for element by contains text "Confirmation"

    And Assert element by contains text "Confirmation"
    And Assert element by contains text "Repeat payment"
    And Assert field "Recipient" in payment confirmation matches regex "^.+$"
    And Assert field "Recipient address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Recipient account" in payment confirmation matches regex "^\d{3}-\d{13}-\d{2}$"
    And Assert field "Urgent payment" in payment confirmation matches regex "^(Yes|No)$"
    And Assert field "Purpose code" in payment confirmation matches regex "^\d{3}$"
    And Assert field "Purpose" in payment confirmation matches regex "^.+$"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert field "Order ID" in payment confirmation matches regex "^.{14}$"
    And Assert label "Debtor name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner"
    And Assert label "Debtor account" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_iban"
    And Assert field "Debtor address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Fee" in payment confirmation matches regex "^\d{1,2},\d{2}\s*RSD$"
    And Assert field "Payment status" in payment confirmation contains text "Executed"

    Then Click on element by containing class "icon-chevron-down" with index "1"
    And Wait for "2" seconds
    And Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Wait for "2" seconds
    And Click on first Executed past payment
    And Wait for element by contains text "Confirmation"

    And Assert element by contains text "Confirmation"
    And Assert element by contains text "Repeat payment"
    And Assert field "Recipient" in payment confirmation matches regex "^.+$"
    And Assert field "Recipient address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Recipient account" in payment confirmation matches regex "^\d{3}-\d{13}-\d{2}$"
    And Assert field "Urgent payment" in payment confirmation matches regex "^(Yes|No)$"
    And Assert field "Purpose code" in payment confirmation matches regex "^\d{3}$"
    And Assert field "Purpose" in payment confirmation matches regex "^.+$"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert field "Order ID" in payment confirmation matches regex "^.{14}$"
    And Assert label "Debtor name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner"
    And Assert label "Debtor account" in payment confirmation contains value from excel "<rowindex>" columnName "savings_account_1_number"
    And Assert field "Debtor address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Fee" in payment confirmation matches regex "^\d{1,2},\d{2}\s*RSD$"
    And Assert field "Payment status" in payment confirmation contains text "Executed"

    Examples:
      | rowindex |
      |        8 |


  @Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Internal_Transfer
  Scenario Outline: Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Internal_Transfer

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Check if cash credit offer appears upon login and if it is dismiss it
    And Wait for element by text "Balance"
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load

    When Click on tab "My Products" from main sidebar
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_BalanceA"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_BalanceC"
    And Click on tab "Payments" from main sidebar
    And Wait for first past payment

    And Enter text "internal" into input field
    And Wait for "1" seconds
    And Wait for first past payment
    And Click on tag "nlb-payment-item"
    And Wait for element by contains text "Recipient"
    And Remember name from expanded past payment under key "keyName"
    And Remember amount from expanded past payment under key "keyPaymentAmount"
    And Remember value from label "Recipient address" in past or upcoming payment under key "keyAddress"
    And Remember value from label "Recipient account number" in past or upcoming payment under key "keyRecipientAccount"
    And Remember value from label "Purpose" in past or upcoming payment under key "keyPurpose"
    And Remember value from label "Account number" in past or upcoming payment under key "keyDebtorAccount"
    And Remember value from label "Fee" in past or upcoming payment under key "keyFeeWithCurrency"
    And Remember fee amount from fee label in past or upcoming payment under key "keyFeeAmount"

    And Click on element by containing text "Repeat payment"
    And Wait for element by contains text "In order to continue all input fields must be filled."

    And Assert element by contains text "Internal transfer"
    And Assert element by contains text "Debtor"
    And Assert element by contains class "accountItemDescription" contains value from key "keyDebtorAccount" is displayed
    And Assert element by contains text "Recipient"
    And Assert element by contains class "accountItemDescription" contains value from key "keyRecipientAccount" is displayed

    And Assert input field by contains text "Payment amount" has value under remembered key "keyPaymentAmount"
    And Assert element with text "Purpose" with following sibling has text "INTERNAL TRANSFER"
    And Click on button with type "submit"
    And Wait for element by contains text "Fee"

    # payment review
    And Assert element with text "Payment amount" with following sibling contains text under key "keyPaymentAmount"
    And Assert element by text "Payment amount" has following sibling "span" that contains text "RSD"
    And Assert element with text "Fee" with following sibling contains text under key "keyFeeAmount"
    And Assert that text "Fee" has first following sibling that contains text "RSD"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "account_details_owner2"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyName"
    #And Assert element by text "Address" and index "2" has first following sibling that contains text from key "keyAddress"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccount"
    And Assert element by text "Purpose" has first following sibling under key "keyPurpose"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by normalized text "Cancel"
    And Assert element by normalized text "Back"
    And Click on button with type "submit"

    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount from key "keyPaymentAmount" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for first past payment
    And Click on tag "nlb-account-selector"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for "1" seconds
    And Refresh page
    And Wait for first past payment

    #past payment
    And Assert first past payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has purpose from key "keyPurpose"
    And Assert first past or upcoming payment has name from key "keyName"
    And Assert first past or upcoming payment has today date
    And Click on first Executed past payment

    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyAddress"
    And Assert label "Recipient account number" in payment confirmation contains value under remembered key "keyRecipientAccount"
    And Assert label "Purpose" in payment confirmation contains value under remembered key "keyPurpose"

    And Assert field "Payment date" in payment confirmation match regex "^\d{2}\.\d{2}\.\d{4}, \d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation match regex "^\d{2}\.\d{2}\.\d{4}$"
    #And Assert label "Name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner2"
    And Assert label "Account number" in payment confirmation contains value under remembered key "keyDebtorAccount"

    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Fee" in payment confirmation has text from key "keyFeeWithCurrency"
    And Assert field "Payment status" in payment confirmation has text "Executed"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "IT_001_Debtor_BalanceA" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount from key "keyPaymentAmount" is correct
    And Compare if current amount balance from key "IT_001_Debtor_BalanceC" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount from key "keyPaymentAmount" is correct

    #transactions debtor
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Assert that first transaction is "Outgoing"
    And Assert that first transaction has purpose from key "keyPurpose"
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that first transaction in product screen has currency "RSD"
    And Assert that first transaction has name from key "keyName"
    And Assert that transaction date for first transaction in product screen is today date
    And Click on down arrow on first transaction do display details
    And Wait for "1" seconds

    #And Assert element with text "Account number" with following sibling "dd" and descendant "nlb-bban" on index "2 "has value from key "keyRecipientAccount"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        3 |

      # todo nezavrseno - jer kod mene ne moze- ide na git - pa ga zavrsavam kod alekse
  @Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Domestic_Payment
  Scenario Outline: Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Domestic_Payment

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Check if cash credit offer appears upon login and if it is dismiss it
    And Wait for element by text "Balance"
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load

    When Click on tab "My Products" from main sidebar
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_BalanceA"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_BalanceC"
    And Click on tab "Payments" from main sidebar
    And Wait for first past payment

    And Enter text "citizen" into input field
    And Wait for "1" seconds
    And Wait for first past payment
    And Click on tag "nlb-payment-item"
    And Wait for element by contains text "Recipient"
    And Remember name from expanded past payment under key "keyName"
    And Remember amount from expanded past payment under key "keyPaymentAmount"
    And Remember value from label "Recipient address" in past or upcoming payment under key "keyAddress"
    And Remember value from label "Recipient account number" in past or upcoming payment under key "keyRecipientAccount"
    #And Remember value from label "Urgent" in past or upcoming payment under key "keyUrgent"
    And Remember value from label "Purpose" in past or upcoming payment under key "keyPurpose"
    And Remember value from label "Account number" in past or upcoming payment under key "keyDebtorAccount"
    And Remember value from label "Fee" in past or upcoming payment under key "keyFeeWithCurrency"
    And Remember fee amount from fee label in past or upcoming payment under key "keyFeeAmount"

    And Click on element by containing text "Repeat payment"
    And Wait for element by contains text "In order to continue all input fields must be filled."

    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Debtor"
    And Assert element by contains class "accountItemDescription" contains value from key "keyDebtorAccount" is displayed
    And Assert element by contains text "Change recipient"
    And Assert element by contains text "Recipient"
    And Assert element by contains class "100 ellipsis" contains value from key "keyName" is displayed
    And Assert element by contains class "accountItemDescription" contains value from key "keyRecipientAccount" is displayed
    And Click on element by containing class "items-center tw-mr-2"
    And Assert input field by text "Account number" has value under remembered key "keyRecipientAccount"
    And Assert input field by text "Name" has value under remembered key "keyName"
    And Assert element by contains text "Save recipient"

    And Assert input field by contains text "Payment amount" has value under remembered key "keyPaymentAmount"
    And Assert element with attribute "aria-label" contains value "Currency: RSD" is displayed
    And Assert input field by contains text "Purpose code" has value under remembered key "keyPurposeCode"
    And Assert input field by text "Purpose" has value under remembered key "keyPurpose"

    And Assert payment date is todays date and in valid date format in Domestic payment
    #TODO provera ako nije urgent da se cekira kao urgent - metoda jos nije testirana
    And Check if urgent checkbox is checked and if set to urgent
    And Assert checkbox "Urgent payment" is checked "true"
    And Click on button with type "submit"
    And Wait for element by contains text "Fee"

       # payment review
    And Assert element with text "Payment amount" with following sibling contains text under key "keyPaymentAmount"
    And Assert element by text "Payment amount" has following sibling "span" that contains text "RSD"
    And Assert element with text "Fee" with following sibling contains text under key "keyFeeAmount"
    And Assert that text "Fee" has first following sibling that contains text "RSD"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "account_details_owner2"
    And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyName"
    #And Assert element by text "Address" and index "2" has first following sibling that contains text from key "keyAddress"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccount"

    And Assert element by text "Purpose" has first following sibling under key "keyPurpose"
    And Assert element by text "Purpose code" has first following sibling under key "keyPurposeCode"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by normalized text "Cancel"
    And Assert element by normalized text "Back"
    And Click on button with type "submit"
    And Wait for element by contains text "Success"

    And Wait for first past payment
    And Click on tag "nlb-account-selector"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for "1" seconds
    And Refresh page
    And Wait for first past payment

    #past payment
    And Assert first past payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has purpose from key "keyPurpose"
    And Assert first past or upcoming payment has name from key "keyName"
    And Assert first past or upcoming payment has today date
    And Click on first Executed past payment

    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyAddress"
    And Assert label "Recipient account number" in payment confirmation contains value under remembered key "keyRecipientAccount"
    And Assert label "Purpose" in payment confirmation contains value under remembered key "keyPurpose"
    And Assert label "Purpose code" in payment confirmation contains value under remembered key "keyPurposeCode"

    And Assert field "Payment date" in payment confirmation match regex "^\d{2}\.\d{2}\.\d{4}, \d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert label "Name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner2"
    And Assert label "Account number" in payment confirmation contains value under remembered key "keyDebtorAccount"

    And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
    And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Fee" in payment confirmation contains text "0,00"
    And Assert field "Fee" in payment confirmation contains text "RSD"
    And Assert field "Payment status" in payment confirmation has text "Executed"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
#    And Assert the available balance from Excel "<rowindex>" columnName "current_account_1_bban" has decreased for amount "keyPaymentAmount" from initial value "IT_001_Debtor_BalanceA"
#    And Assert the current balance from Excel "<rowindex>" columnName "current_account_1_bban" has decreased for amount "keyPaymentAmount" from initial value "IT_001_Debtor_BalanceC"

    #transactions debtor
    Then Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Assert that first transaction is "Outgoing"
    And Assert that first transaction has purpose from key "keyPurpose"
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that first transaction in product screen has currency "RSD"
    And Assert that first transaction has name from key "keyName"
    And Assert that transaction date for first transaction in product screen is today date
    And Click on down arrow on first transaction do display details
    And Wait for "1" seconds

    #Todo account number provera!
    #And Assert element with text "Account number" with following sibling "dd" and descendant "nlb-bban" on index "2 "has value from key "keyRecipientAccount"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        3 |


  @Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Prenesi
  Scenario Outline: Payments_Payments_Arhive_Resubmit_Payments_From_Past_Payment_List_[WEB]-Prenesi

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Check if cash credit offer appears upon login and if it is dismiss it
    And Wait for element by text "Balance"
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load

    When Click on tab "My Products" from main sidebar
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_BalanceA"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_BalanceC"
    And Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Enter text "Prenesi" into input field
    And Wait for "1" seconds
    And Wait for first past payment
    And Click on tag "nlb-payment-item"
    And Wait for element by contains text "Recipient"
    And Remember name from expanded past payment under key "keyName"
    And Remember amount from expanded past payment under key "keyPaymentAmount"
    And Remember value from label "Recipient address" in past or upcoming payment under key "keyAddress"
    And Remember value from label "Recipient account number" in past or upcoming payment under key "keyRecipientAccount"
    And Remember value from label "Purpose" in past or upcoming payment under key "keyPurpose"
    And Remember value from label "Account number" in past or upcoming payment under key "keyDebtorAccount"
    And Remember value from label "Fee" in past or upcoming payment under key "keyFeeWithCurrency"
    And Remember fee amount from fee label in past or upcoming payment under key "keyFeeAmount"

    And Click on element by containing text "Repeat payment"
    And Wait for element by contains text "In order to continue all input fields must be filled."

    And Assert element by contains text "Internal transfer"
    And Assert element by contains text "Debtor"
    And Assert element by contains class "accountItemDescription" contains value from key "keyDebtorAccount" is displayed
    And Assert element by contains text "Recipient"
    And Assert element by contains class "accountItemDescription" contains value from key "keyRecipientAccount" is displayed

    And Assert input field by contains text "Payment amount" has value under remembered key "keyPaymentAmount"
    And Assert element with text "Purpose" with following sibling has text "INTERNAL TRANSFER"
    And Click on button with type "submit"
    And Wait for element by contains text "Fee"

    # payment review
    And Assert element with text "Payment amount" with following sibling contains text under key "keyPaymentAmount"
    And Assert element by text "Payment amount" has following sibling "span" that contains text "RSD"
    And Assert element with text "Fee" with following sibling contains text under key "keyFeeAmount"
    And Assert that text "Fee" has first following sibling that contains text "RSD"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "account_details_owner2"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyName"
    #And Assert element by text "Address" and index "2" has first following sibling that contains text from key "keyAddress"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccount"
    And Assert element by text "Purpose" has first following sibling under key "keyPurpose"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by normalized text "Cancel"
    And Assert element by normalized text "Back"
    And Click on button with type "submit"

    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount from key "keyPaymentAmount" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for first past payment
    And Click on tag "nlb-account-selector"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for "1" seconds
    And Refresh page
    And Wait for first past payment

    #past payment
    And Assert first past payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has purpose from key "keyPurpose"
    And Assert first past or upcoming payment has name from key "keyName"
    And Assert first past or upcoming payment has today date
    And Click on first Executed past payment

    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyAddress"
    And Assert label "Recipient account number" in payment confirmation contains value under remembered key "keyRecipientAccount"
    And Assert label "Purpose" in payment confirmation contains value under remembered key "keyPurpose"

    And Assert field "Payment date" in payment confirmation match regex "^\d{2}\.\d{2}\.\d{4}, \d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation match regex "^\d{2}\.\d{2}\.\d{4}$"
    #And Assert label "Name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner2"
    And Assert label "Account number" in payment confirmation contains value under remembered key "keyDebtorAccount"

    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Fee" in payment confirmation has text from key "keyFeeWithCurrency"
    And Assert field "Payment status" in payment confirmation has text "Executed"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "IT_001_Debtor_BalanceA" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount from key "keyPaymentAmount" is correct
    And Compare if current amount balance from key "IT_001_Debtor_BalanceC" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount from key "keyPaymentAmount" is correct

    #transactions debtor
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Assert that first transaction is "Outgoing"
    And Assert that first transaction has purpose from key "keyPurpose"
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that first transaction in product screen has currency "RSD"
    And Assert that first transaction has name from key "keyName"
    And Assert that transaction date for first transaction in product screen is today date
    And Click on down arrow on first transaction do display details
    And Wait for "1" seconds

    #And Assert element with text "Account number" with following sibling "dd" and descendant "nlb-bban" on index "2 "has value from key "keyRecipientAccount"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        3 |