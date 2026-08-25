Feature: Recipients

  @Payments_Recipient-Save_Recipient_[WEB]
  Scenario Outline: Payments_Recipient-Save_Recipient_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Click on element by text "Payments"
    And Click on element by text "Domestic payment"
    And Assert today date in Payment date in payment review
    And Assert element by class "icon-calendar-today"

    When Enter text "205-9001007790944-88" in "Account number" input field and remember under key "accountNumberKey"
    And Enter text "Osir" in "Name" input field and remember under key "nameKey"
    And Enter text "Kaludjerica" in "street" input field and remember under key "streetKey"
    And Enter text "Beograd" in "City" input field and remember under key "cityKey"
    And Enter text "1" in "Payment amount" input field and remember under key "paymentAmountKey"
    And Enter text "75" in "Reference number" input field and remember under key "referenceNumberKey"
    And Assert checkbox "Save recipient" is checked "false"
    And Click on element by containing text "Save recipient"
    And Assert checkbox "Save recipient" is checked "true"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "purposeKey"
    And Click on button with type "submit"

    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "paymentAmountKey" is displayed
    And Assert element by contains text "Fee"
    And Assert contains text under key "accountNumberKey" is displayed
    And Assert contains text under key "nameKey" is displayed
    And Assert contains text under key "streetKey" is displayed
#    And Assert contains text under key "cityKey" is displayed
    And Assert contains text under key "referenceNumberKey" is displayed
    And Assert contains text under key "purposeKey" is displayed
    And Click on button with type "submit"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "1.00" and currency "RSD" with message "Success"

    And Assert element by contains text "Success"
    And Assert element by contains text "Do you want to save payment data?"
    And Assert element by contains text "Close without saving"
    And Assert element by contains text "Save recipient"
    And Assert element by contains text "Save template"
    And Assert element by contains text "Save both"
    And Click on normalized text "Save recipient"
    And Assert element by contains text "Recipient saved"
    And Wait for element by contains text "Domestic payment"
#    And Assert contains text under key "nameKey" is displayed
#    And Assert contains text under key "purposeKey" is displayed
#    And Click on element with text from key "purposeKey"
#    And Assert contains text under key "accountNumberKey" is displayed
#    And Assert contains text under key "nameKey" is displayed
#    And Assert contains text under key "streetKey" is displayed
##    And Assert recipient city equals remembered key "cityKey"
##    And Assert contains text under key "cityKey" is displayed
#    And Assert contains text under key "referenceNumberKey" is displayed
#    And Assert contains text under key "purposeKey" is displayed
#    And Assert payment status is "Executed"

    Then Click on tab "Recipients" from main sidebar
    And Wait for first recipient
    And Click on recipient name by key "nameKey"
    And Assert contains text under key "nameKey" is displayed
    And Assert contains text under key "streetKey" is displayed
#    And Assert contains text under key "cityKey" is displayed
    And Assert recipient city equals remembered key "cityKey"
    And Assert contains text under key "purposeKey" is displayed

    Examples:
      | rowindex |
      |        5 |


  @Payments_Recipient-Delete_Recipient_[WEB]
  Scenario Outline: Payments_Recipient-Delete_Recipient_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Recipients" from main sidebar
    And Assert Recipient list in recipient tab is displayed
    And Remember name of first Recipient in recipient tab under key "nameOfFirstRecipientKey"
    And Click on first recipient
    And Assert element by contains text "Recipient details"
    And Assert element by contains text "Repeat one of the last 5 payments"
    And Assert Recipient payments is displayed correctly
    And Assert element by contains text "Delete"
    And Assert element by contains text "Edit"
    
    And Click on element by containing text "Delete"
    And Assert element by contains text "Delete recipient"
    And Assert element by contains text "Are you sure you want to delete this recipient? This action cannot be undone"
    And Assert element by contains text "Cancel"
    And Assert element by contains text "Delete"
    And Click on NLB button "Cancel"
    And Assert Recipient payments is displayed correctly
    And Click on element by containing text "Delete"
    And Assert element by contains text "Cancel"
    And Click on NLB button "Delete"
    And Assert element by contains text "Success"
    And Assert element by contains text "You have successfully deleted recipient."

    Then Wait for first recipient
    And Assert text under key "nameOfFirstRecipientKey" is not displayed
    And Click on tab "Payments" from main sidebar
    And Click on element by containing text "Domestic payment"
    And Wait for element by contains text "Debtor"
    And Click on normalized text "Select from list"
    And Click on normalized text "Select recipient"
    And Assert text under key "nameOfFirstRecipientKey" is not displayed

    Examples:
      | rowindex |
      |        5 |


  @Payments_Recipient-Update_Recipient_[WEB]
  Scenario Outline: Payments_Recipient-Update_Recipient_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Recipients" from main sidebar
    And Assert Recipient list in recipient tab is displayed
    And Remember name of first Recipient in recipient tab under key "nameOfFirstRecipientKey"
    And Remember account number of first Recipient in recipient tab under key "accountNumberOfFirstRecipientKey"
    And Click on first recipient
    And Remember Recipient street in recipient tab under key "streetOfFirstRecipientKey"
    And Remember Recipient city in recipient tab under key "cityOfFirstRecipientKey"
    And Click on tab "Payments" from main sidebar
    And Click on element by containing text "Domestic payment"
    And Wait for element by contains text "Debtor"
    And Click on normalized text "Select from list"
    And Click on normalized text "Select recipient"
    And Assert text under key "nameOfFirstRecipientKey" is displayed
    And Assert text under key "accountNumberOfFirstRecipientKey" is displayed
    And Click on first recipient
    And Assert element by contains text "Name"
    And Enter text "Update primaoca" into "Name" input field and remember it under key "changedNameKey"
    And Assert element by contains text "Street and street number"
    And Enter text "Krusevacka 22" into "street" input field and remember it under key "changedStreetKey"
    And Assert element by contains text "City"
    And Enter text "Krusevac" into "City" input field and remember it under key "changedCityKey"
    And Assert checkbox "Save recipient" is checked "false"
    And Click on element by containing text "Save recipient"
    And Assert checkbox "Save recipient" is checked "true"
    And Assert element by contains text "Payment amount"
    And Enter text "0,1" into Payment amount input field and remember it under key "paymentAmountKey"
    And Click on button with type "submit"

    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "paymentAmountKey" is displayed
    And Assert element by contains text "Fee"
    And Click on button with type "submit"

    And Assert element by contains text "Success"
    And Assert element by contains text "Do you want to save payment data?"
    And Assert element by contains text "Close without saving"
    And Assert element by contains text "Save recipient"
    And Assert element by contains text "Save template"
    And Assert element by contains text "Save both"
    And Click on normalized text "Save recipient"
#    And Assert element by contains text "Recipient saved"
    And Assert element by contains text "Contact updated"
    And Wait for element by contains text "Domestic payment"
    And Assert contains text under key "nameOfFirstRecipientKey" is displayed
    And Click on element with text from key "changedNameKey"
    And Assert payment status is "Executed"

    Then Click on tab "Recipients" from main sidebar
    And Click on recipient name by key "changedNameKey"
    And Assert text under key "changedStreetKey" is displayed
    And Assert text under key "changedCityKey" is displayed

    Examples:
      | rowindex |
      |        5 |


  @Payments_Recipient-Edit_Recipient-Invalid_[WEB]
  Scenario Outline: Payments_Recipient-Edit_Recipient-Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Recipients" from main sidebar
    And Remember name of first Recipient in recipient tab under key "nameOfFirstRecipientKey"
    And Remember account number of first Recipient in recipient tab under key "accountNumberOfFirstRecipientKey"
    And Click on first recipient
    And Assert element by contains text "Delete"
    And Assert element by contains text "Edit"
    And Click on element by containing text "Edit"
    And Assert element by contains text "Name"
    And Enter text "" into "Name" input field in Edit recipient
    And Assert NLB Validation error "Name is required"
    And Assert element by contains text "Street and street number"
    And Enter text "" into "street" input field in Edit recipient
    And Assert NLB Validation error "Street and street number is required"
    And Assert element by contains text "City"
    And Enter text "" into "City" input field in Edit recipient
    And Assert NLB Validation error "City is required"
    And Click on NLB button "Save"
    And Assert element by contains text "Edit recipient"
    And Assert text under key "accountNumberOfFirstRecipientKey" is displayed

    Then Click on NLB button "Cancel"
    And Assert element by contains text "Discard changes"
    And Assert element by contains text "Are you sure you want to discard your changes? This action cannot be undone"
    And Assert NLB button "Cancel"
    And Assert NLB button "Discard"
    And Click on NLB button "Discard"
    And Assert text under key "nameOfFirstRecipientKey" is displayed

    Examples:
      | rowindex |
      |        1 |


  @Payments_Recipient-Edit_Recipient-Edit_Account_number-invalid_[WEB]
  Scenario Outline: Payments_Recipient-Edit_Recipient-Edit_Account_number-invalid_[WEB]


    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Recipients" from main sidebar
    And Click on first recipient
    And Assert element by contains text "Delete"
    And Assert element by contains text "Edit"
    And Click on element by containing text "Edit"

    Then Assert Account number in Edit recipient is not editable

    Examples:
      | rowindex |
      |        1 |


    #Stabilizuj test kada ne bude imao bug. Sad moze da se menja account number
  @Payments_Recipient-Update_Recipient-Update_Account_number_[WEB]
  Scenario Outline: Payments_Recipient-Update_Recipient-Update_Account_number_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    And Click on element by containing text "Pay or transfer"
    And Click on element by tag "i" contains class "icon-recipients-list"
    And Click on element by containing text "340-0000032535954-64"
    And Remember recipient number and name
    And Change input in label "Account number" to "205900102079784269"
    And Enter amount "100"
    And Click on element by containing text "Confirm"
    And Click on element by containing text "Confirm"

    And Click on tab "Recipients" from main sidebar
    And Assert that recipient has same accNumber

    Examples:
      | rowindex |
      |        1 |


  @Payments_Recipient-Edit_Recipient_[WEB]
  Scenario Outline: Payments_Recipient-Edit_Recipient_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Recipients" from main sidebar
    And Remember name of first Recipient in recipient tab under key "nameOfFirstRecipientKey"
    And Remember account number of first Recipient in recipient tab under key "accountNumberOfFirstRecipientKey"
    And Click on first recipient
    And Assert element by contains text "Delete"
    And Assert element by contains text "Edit"
    And Click on element by containing text "Edit"

    And Assert Account number in Edit recipient is not editable
    And Assert element by contains text "Name"
    And Enter random text into "Name" input field and remember it under key "keyName"
    And Assert element by contains text "Street and street number"
    And Enter random text into "Street" input field and remember it under key "keyStreet"
    And Assert element by contains text "City"
    And Enter random text into "City" input field and remember it under key "keyCity"
    And Assert NLB button "Cancel"
    And Assert NLB button "Save"
    And Click on NLB button "Save"
    
    Then Assert element by contains text "Success"
    And Assert element by contains text "Recipient saved"
    And Assert text under key "nameOfFirstRecipientKey" is not displayed
    And Assert text under key "accountNumberOfFirstRecipientKey" is displayed
    And Assert text under key "keyName" is displayed
    And Click on element with text from key "keyName"
    And Assert text under key "keyStreet" is displayed
    And Assert text under key "keyCity" is displayed

    And Click on tab "Payments" from main sidebar
    And Click on element by containing text "Domestic payment"
    And Wait for element by contains text "Debtor"
    And Click on normalized text "Select from list"
    And Click on normalized text "Select recipient"
    And Assert text under key "keyName" is displayed
    And Assert text under key "accountNumberOfFirstRecipientKey" is displayed

    Examples:
      | rowindex |
      |        5 |


  @Payments_Recipient_Last_5_Payments_Of_Recipient_[WEB]-View_And_Repeat
  Scenario Outline: Payments_Recipient_Last_5_Payments_Of_Recipient_[WEB]-View_And_Repeat

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Recipients" from main sidebar
    And Wait for first recipient

    And Enter text "VKLARAGAN" into input field
    And Wait for "1" seconds
    And Wait for first recipient
    #And Click on element by containing text "205-"
    And Click on element by containing text "VKLARAGAN"
    And Wait for element by tag "nlb-payment-item"
    And Remember text from element with attribute "class" containing value "subheadline m" and index "2" under key "keyPurpose"
    And Remember text from element with attribute "class" containing value "caption m" and index "2" under key "keyName"
    And Remember account number in recipients list related to name "Staniša Nikola - VKLARAGAN" under key "keyAccountNumber"
    And Remember amount of first payment in recipient details under key "keyAmountClean"

    And Click on element by containing class "tw-justify-center tw-h" with index "1"
    And Wait for element by contains text "Debtor"

    And Assert element by contains text "Domestic payment"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Change recipient"

    And Assert element by contains class "100 ellipsis" contains value from key "keyName" is displayed
    And Assert element by contains class "accountItemDescription" contains value from key "keyAccountNumber" is displayed

    And Click on element by containing class "icon-chevron-down" with index "2"
    And Wait for element by contains text "Account number"
    And Assert input field by contains text "Account number" has value under remembered key "keyAccountNumber"
    And Assert input field by contains text "Name" has value under remembered key "keyName"
    And Remember text from element with attribute "class" containing value "tw-box-border tw-w-full" and index "3" under key "keyStreet"
    And Remember text from element with attribute "class" containing value "tw-box-border tw-w-full" and index "4" under key "keyCity"
    And Assert input field by contains text "Payment amount" has value under remembered key "keyAmountClean"
    And Assert input field by text "Purpose" has value under remembered key "keyPurpose"
    And Assert element by contains text "Model"
    And Assert element by contains text "Reference number"
    And Assert payment date is todays date and in valid date format in Domestic payment

    And Assert element by contains text "Cancel"
    And Assert element by contains text "Back"
    And Click on button with type "submit"

    # payment review
    And Wait for element by contains text "Fee"
    And Assert element with text "Payment amount" with following sibling contains text under key "keyAmountClean"
    And Assert element by text "Payment amount" has following sibling "span" that contains text "RSD"
    And Assert element by text "Fee" has following sibling "span" that contains text "0,00 RSD"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "account_details_owner2"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyName"
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyAccountNumber"

    And Assert element by text "Payment details"
    And Assert element by text "Purpose" has first following sibling under key "keyPurpose"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by contains text "Cancel"
    And Assert element by contains text "Back"
    And Click on button with type "submit"
    And Try to assert that payment is "Success" and send command to Authorize method
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "3.00" and currency "RSD" with message "Success"

    And Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Wait for "2" seconds

    And Click on tag "nlb-account-selector"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for first past payment
    And Wait for "1" seconds
    And Refresh page
    And Wait for first past payment

    #past payment
    And Assert first past payment has amount from key "keyAmountClean" in currency "RSD"
    And Assert first past or upcoming payment has purpose from key "keyPurpose"
    And Assert first past or upcoming payment has name from key "keyName"
    And Assert first past or upcoming payment has today date

    And Click on first Executed past payment
    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyCity"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyStreet"
    And Assert label "Recipient account number" in payment confirmation contains value under remembered key "keyAccountNumber"
    And Assert label "Purpose" in payment confirmation contains value under remembered key "keyPurpose"
    And Assert field "Payment date" in payment confirmation match regex "^\d{2}\.\d{2}\.\d{4}, \d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation match regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert field "Order number" in payment confirmation match regex "^[A-Z0-9]{14}$"
    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    And Assert label "Name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner2"
    #And Assert label "Debtor address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert label "Debtor address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Fee" in payment confirmation contains text "0,00"
    And Assert field "Fee" in payment confirmation contains text "RSD"
    And Assert field "Payment status" in payment confirmation has text "Executed"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare available balance from Excel "<rowindex>" columnName "current_account_1_bban" has decreased for amount "keyAmountClean" from initial value "key_IT_001_Debtor_Available_Balance"
    And Compare current balance from Excel "<rowindex>" columnName "current_account_1_bban" has decreased for amount "keyAmountClean" from initial value "key_IT_001_Debtor_Current_Balance"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"

    Then Wait for first transaction in Product details
    And Assert that first transaction is "Outgoing"
    And Assert that first transaction has purpose from key "keyPurpose"
    And Assert that first transaction has name from key "keyName"
    And Assert that amount for first transaction in product screen is from key "keyAmountClean"
    And Assert that first transaction in product screen has currency "RSD"
    And Click on down arrow on first transaction do display details
    And Assert that transaction date for first transaction in product screen is today date
#    And Wait for element by contains text "Value date"
    And Assert element by text "Account number" has following sibling "dd" that contains text from key "keyAccountNumber"
    And Assert amount in transaction details has value under key "keyAmountClean" in currency "RSD"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^[A-Z0-9]{14}$"

    Examples:
      | rowindex |
      |        5 |