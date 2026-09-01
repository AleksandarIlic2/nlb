Feature: Domestic_Payments

  @Payments-Domestic_Payments-Back_Button_[WEB]
  Scenario Outline: Payments-Domestic_Payments-Back_Button_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Click on element by text "Payments"
    And Click on element by text "Domestic payment"
    And Assert today date in Payment date in payment review
    And Assert element by class "icon-calendar-today"

    When Click on element by xpath "//nlb-account-selector"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Enter text "205-9001001539786-67" in "Account number" input field and remember under key "accountNumberKey"
    And Enter text "NBA" in "Name" input field and remember under key "nameKey"
    And Enter text "Zarkovo 32" in "street" input field and remember under key "streetKey"
    And Enter text "Beograd" in "City" input field and remember under key "cityKey"
    And Enter text "0,1" in "Payment amount" input field and remember under key "paymentAmountKey"
    And Enter text "75" in "Reference number" input field and remember under key "referenceNumberKey"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment date"
    And Assert payment date is todays date and in valid date format in Domestic payment
    And Assert element by contains text "Urgent payment"
    And Assert checkbox "Urgent payment" is checked "true"
#    And Assert element by contains text "Cancel"
    And Assert element by contains text "Back"
    And Assert element by contains text "Confirm"
    And Click on element by containing text "Confirm"
    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "paymentAmountKey" is displayed
#    And Assert element by contains text "0,10 RSD"
    And Assert element by contains text "Fee"
    And Assert element by xPath "//*[contains(text(),'Fee')]/following-sibling::span" has text in format "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s[A-Z]{3}$"

    Then Assert element by contains text "Debtor"
#    And Assert element by contains text from excel "<rowindex>" columnName "account_details_owner" is displayed
#    //And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Assert element by contains text "Recipient"
#    And Assert "Name" element under key "nameKey" with index "2" is displayed
    And Assert text under key "nameKey" is displayed
#    And Assert address from keys "streetKey" and "cityKey" is displayed
    And Assert contains text under key "streetKey" is displayed
#    And Assert contains text under key "cityKey" is displayed
#    And Assert "Account number" element under key "accountNumberKey" with index "2" is displayed
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "accountNumberKey"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "Purpose code"
    And Assert element by contains text "Reference number"
    And Assert "Reference number" element under key "referenceNumberKey" with index "1" is displayed
    And Assert element by contains text "Back"
    And Assert element by contains text "Confirm"
    And Click on element by containing text "Back"
    And Wait for element by contains text "Domestic payment"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Click on Recipient account selector in Domestic payment
    And Assert input field by contains text "Account number" has value under remembered key "accountNumberKey"
    And Assert input field by contains text "Name" has value under remembered key "nameKey"
    And Assert input field by contains text "street" has value under remembered key "streetKey"
    And Assert input field by contains text "City" has value under remembered key "cityKey"
    And Assert input field by contains text "Payment amount" has value under remembered key "paymentAmountKey"
    And Assert input field by contains text "Reference number" has value under remembered key "referenceNumberKey"
    And Assert checkbox "Save recipient" is checked "false"
    And Assert checkbox "Urgent payment" is checked "true"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments-Create_New_Recipient_[WEB]
  Scenario Outline: Payments-Domestic_Payments-Create_New_Recipient_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Current_Balance"

    When Click on element by containing text "Payments"
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Check data and choose “Next”"
    And Assert element by contains text "Debtor"
    And Assert element by xPath "//nlb-account-selector"
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Select from list or enter recipient data."
    And Assert element by contains text "Select from list"

    And Assert element by contains text "Account number"
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban" into "Account number" input field
    And Assert element by contains text "Name"
    And Enter text "Enil Cicvi" into "Name" input field and remember it under key "keyName"
    And Assert element by contains text "Street and street number"
    And Enter text "Ritopek 21" into "street" input field and remember it under key "keyStreet"
    And Assert element by contains text "City"
    And Enter text "Grocka" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Click on element by containing text "Save recipient"
    And Assert element by tag "nlb-check-box" index "1"
    And Assert checkbox "Save recipient" is checked "true"
    And Assert element by contains text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by contains text "Payment amount"
    And Enter text "5" into Payment amount input field and remember it under key "paymentAmountKey"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by contains text "Purpose code"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "Model"
    And Assert element by contains text "Reference number"
    And Assert element by contains text "Payment date"
    And Assert Calendar filter is shown
    And Assert element by contains text "Urgent payment"
    And Assert element by tag "nlb-check-box" index "2"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    Then Wait for element by contains text "Payment amount"
#    And Assert element by contains text "5,00 RSD"
    And Assert payment amount under key is "paymentAmountKey" is displayed
    
#    And Assert "Fee" in payment review is "15,00 RSD"

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Debtor"
    And Assert element by contains text "Name"
#    //And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text "Address"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
#    And Assert element by tag "dt" containing text "Name" with index "2"
    And Assert text under key "keyName" is displayed
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by contains text from excel "<rowindex>" columnName "domestic_payment_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Payment details"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "Purpose code"
    And Assert element by contains text "Value date"
    And Assert element by contains text "Urgent payment"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"
    And Assert element by contains text "Do you want to save payment data?"
    And Assert element by contains text "Close without saving"
    And Assert element by contains text "Save recipient"
    And Assert element by contains text "Save template"
    And Assert element by contains text "Save both"
    And Click on normalized text "Save recipient"
    And Assert element by contains text "Success"
    And Wait for element by contains text "Domestic payment"
    And Click on tab "My Products" from main sidebar
    And Compare if available amount balance from key "IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "5" is correct
    And Compare if current amount balance from key "IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "5" is correct

    And Click on tab "Recipients" from main sidebar
    And Assert element by text "Recipients" index "1" is displayed
    And Assert element by contains text "You can save creditor information as contact from each payment. Contacts can be used for future payments to same creditor."
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Assert "input" field with placeholder "Type here to search"
    And Click on element with text from key "keyName"
    And Assert element by contains text from excel "<rowindex>" columnName "domestic_payment_bban" is displayed
    And Assert element by xPath "//*[text()='Address']/following-sibling::div/div[1]" has text form key "keyStreet"
    And Assert element by xPath "//*[text()='Address']/following-sibling::div/div[2]" has text form key "keyCity"

    Examples:
      | rowindex |
      |        5 |


  @Domestic_Payments_Modify_Data_[WEB]
  Scenario Outline: Domestic_Payments_Modify_Data_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Current_Balance"

    When Click on element by containing text "Payments"
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Check data and choose “Next”"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Select from list or enter recipient data."
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Click on normalized text "Select from list"
    And Assert element by contains text "Select template"
    #Lose spelovano. RECEPIENT umesto RECIPIENT. Padace kad ga isprave
    And Assert element by contains text "Select recipient"
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    #Lose spelovano. RECEPIENT umesto RECIPIENT. Padace kad ga isprave
    And Click on normalized text "Select recipient"
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Click on first recipient
    And Assert element by class "tw-items-center" containing text "Change recipient"
    And Assert element by contains text "Account number"
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban" into "Account number" input field
    And Assert element by contains text "Name"
    And Enter random name into label with text "Name" with following sibling "div" that has descendant "input" and remember it under key "keyName"
    And Assert element by contains text "Street and street number"
    And Enter text "Juzni bulevar 55" into "street" input field and remember it under key "keyStreet"
    And Assert element by contains text "City"
    And Enter text "Beograd" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Click on element by containing text "Save recipient"
    And Assert element by tag "nlb-check-box" index "1"
    And Assert element by contains text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by contains text "Payment amount"
    And Enter text "2" into Payment amount input field and remember it under key "paymentAmountKey"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by contains text "Purpose code"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "Model"
    And Assert element by contains text "Reference number"
    And Assert element by contains text "Payment date"
    And Assert Calendar filter is shown
    And Assert element by contains text "Urgent payment"
    And Assert element by tag "nlb-check-box" index "2"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    Then Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "paymentAmountKey" is displayed
#    And Assert element by contains text "5,00 RSD"
    And Assert element by contains text "Fee"

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Debtor"
    And Assert element by contains text "Name"
#    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text "Address"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
#    And Assert element by tag "dt" containing text "Name" with index "2"
    And Assert text under key "keyName" is displayed
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by contains text from excel "<rowindex>" columnName "domestic_payment_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Payment details"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "Purpose code"
    And Assert element by contains text "Value date"
    And Assert element by contains text "Urgent payment"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"
    And Assert element by contains text "Do you want to save payment data?"
    And Assert element by contains text "Close without saving"
    And Assert element by contains text "Save recipient"
    And Assert element by contains text "Save template"
    And Assert element by contains text "Save both"
    And Click on normalized text "Save recipient"
    And Assert element by contains text "Success"
    And Wait for element by contains text "Domestic payment"
    And Click on tab "My Products" from main sidebar
    And Compare if available amount balance from key "IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "2" is correct
    And Compare if current amount balance from key "IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "2" is correct

    And Click on tab "Recipients" from main sidebar
    And Assert element by text "Recipients" index "1" is displayed
    And Assert element by contains text "You can save creditor information as contact from each payment. Contacts can be used for future payments to same creditor."
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Assert "input" field with placeholder "Type here to search"
    And Click on element with text from key "keyName"
    And Assert element by contains text from excel "<rowindex>" columnName "domestic_payment_bban" is displayed
    And Assert element by xPath "//*[text()='Address']/following-sibling::div/div[1]" has text form key "keyStreet"
    And Assert element by xPath "//*[text()='Address']/following-sibling::div/div[2]" has text form key "keyCity"

    Examples:
      | rowindex |
      |        5 |


  @Domestic_Payments_In_Future_[WEB]
  Scenario Outline: Domestic_Payments_In_Future_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Click on element by text "Payments"
    And Click on element by text "Domestic payment"
    And Assert today date in Payment date in payment review
    And Assert element by class "icon-calendar-today"

    When Enter text "205-9001010537788-94" in "Account number" input field and remember under key "accountNumberKey"
#    When Enter text "205-9001010537788-94" in "AccountNumber" input field and remember under key "accountNumberKey"
    And Enter text "Enil" in "Name" input field and remember under key "nameKey"
    And Enter text "Kaludjerica" in "street" input field and remember under key "streetKey"
    And Enter text "Beograd" in "City" input field and remember under key "cityKey"
    And Enter text "0,1" in "Payment amount" input field and remember under key "paymentAmountKey"
    And Enter text "75" in "Reference number" input field and remember under key "referenceNumberKey"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment date"
    And Assert element by contains text "Urgent payment"
    And Assert checkbox "Urgent payment" is checked "true"
#    And Assert element by contains text "Cancel"
    And Assert element by contains text "Back"
    And Assert element by contains text "Confirm"

    Then Click on calendar icon with index "1"
    And Click on date 30 days in the future in second payment screen
    And Assert checkbox "Urgent payment" is checked "false"
    And Click on element by containing text "Confirm"
    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "paymentAmountKey" is displayed

    And Assert element by contains text "Debtor"
#    And Assert element by contains text from excel "<rowindex>" columnName "account_details_owner" is displayed
#    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Assert element by contains text "Recipient"
    And Assert text under key "nameKey" is displayed
#    And Assert "Account number" element under key "accountNumberKey" with index "2" is displayed

    And Assert element by contains text "Payment"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "Purpose code"
    And Assert element by contains text "Reference number"
    And Assert "Reference number" element under key "referenceNumberKey" with index "1" is displayed
#    And Assert element by contains text "Payment date"
    And Assert date 30 days in future in payment review
#    And Assert element by contains text "Cancel"
    And Assert element by contains text "Back"
    And Assert element by contains text "Confirm"
    And Click on element by containing text "Confirm"
    And Assert element by contains text "Success"

    And Click on element by containing text "Upcoming payments"
    And Click on element with text from key "nameKey"
    And Wait for "2" seconds
    And Assert text under key "nameKey" is displayed
#    And Assert element by contains text from excel "<rowindex>" columnName "account_details_owner" is displayed
#    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Assert text under key "accountNumberKey" is displayed
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "streetKey"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "cityKey"

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments_[WEB]
  Scenario Outline: Payments-Domestic_Payments_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Check data and choose “Next”"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Select from list or enter recipient data."
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains class "subheadline bold" ends with "RSD"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Click on normalized text "Select from list"
    And Assert element by contains text "Select template"
    And Assert element by contains text "Select recipient"
    And Assert element by xPath "//nlb-search-box"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    And Click on normalized text "Select recipient"
    And Assert element by xPath "//nlb-search-box"
    And Wait for "2" seconds
    And Click on first recipient
    And Assert element by class "tw-items-center" containing text "Change recipient"
    And Assert element by contains text "Account number"
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban" into "Account number" input field
    And Assert element by contains text "Name"
    And Enter random name into label with text "Name" with following sibling "div" that has descendant "input" and remember it under key "keyName"
    And Assert element by contains text "Street and street number"
    And Enter text "Juzni bulevar 55" into "street" input field and remember it under key "keyStreet"
    And Assert element by contains text "City"
    And Enter text "Beograd" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"
    And Assert element by contains text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by contains text "Payment amount"
    And Enter text "3" into Payment amount input field and remember it under key "paymentAmountKey"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by contains text "Purpose code"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"
    And Assert element by contains text "Purpose"
#    And Enter text "Payment for services 2" into "Purpose" input field and remember it under key "keyPurpose"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"
    And Assert element by contains text "Model"
    And Assert element by contains text "Reference number"
    And Assert element by contains text "Payment date"
    And Assert payment date is todays date and in valid date format in Domestic payment
    And Assert Calendar filter is shown
    And Assert element by contains text "Urgent payment"
    And Assert checkbox "Urgent payment" is checked "true"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    Then Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "paymentAmountKey" is displayed
    And Assert element by contains text "Fee"

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Debtor"
    And Assert element by contains text "Name"
#    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text "Address"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
#    And Assert element by tag "dt" containing text "Name" with index "2"
    And Assert text under key "keyName" is displayed
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by contains text from excel "<rowindex>" columnName "domestic_payment_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Payment details"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "Purpose code"
    And Assert element by contains text "Value date"
    And Assert element by contains text "Urgent payment"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"
#    And Try to assert that payment is "Success" and send command to Authorize method
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "3.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"
    And Wait for element by contains text "Domestic payment"
    And Click on normalized text "Past payments"
    And Wait for "1" seconds
    And Refresh page
    And Wait for first past payment
    And Assert text under key "keyPurpose" is displayed
    And Click on tab "My NLB" from main sidebar
#    And Wait for element by text "Pay or transfer"
    And Wait for element by tag "nlb-dashboard-carousel"
    And Wait for "2" seconds
    And Assert text under key "keyPurpose" is displayed
    And Assert text under key "keyName" is displayed
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "3" is correct
    And Compare if current amount balance from key "IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "3" is correct

    Examples:
      | rowindex |
      |        5 |


    #Automatizovano na UAT-u. Nema ga u Excelu za TST
  @Payments-Domestic_Payments-Confirmation_[WEB]
  Scenario Outline: Payments-Domestic_Payments-Confirmation_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Check data and choose “Next”"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Select from list or enter recipient data."
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains class "subheadline bold" ends with "RSD"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Click on normalized text "Select from list"
    And Assert element by contains text "Select template"
    And Assert element by contains text "Select recipient"
    And Assert element by xPath "//nlb-search-box"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    #Lose spelovano. RECEPIENT umesto RECIPIENT. Padace kad ga isprave
    And Click on normalized text "Select recipient"
    And Assert element by xPath "//nlb-search-box"
    And Wait for "2" seconds
    And Click on first recipient
    And Assert element by class "tw-items-center" containing text "Change recipient"
    And Assert element by contains text "Account number"
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban" into "Account number" input field
    And Assert element by contains text "Name"
    And Enter text "Ime Automatizacija Web" into "Name" input field and remember it under key "keyName"
    And Assert element by contains text "Street and street number"
    And Enter text "Juzni bulevar 55" into "street" input field and remember it under key "keyStreet"
    And Assert element by contains text "City"
    And Enter text "Beograd" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"
    And Assert element by contains text "Payment"
    And Assert element by contains text "In order to continue all input fields must be filled."
    And Assert element by contains text "Payment amount"
    And Enter text "4" into Payment amount input field and remember it under key "paymentAmountKey"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by contains text "Purpose code"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"
    And Assert element by contains text "Purpose"
    And Enter text "Payment for services" into "Purpose" input field and remember it under key "keyPurpose"
    And Assert element by contains text "Model"
    And Assert element by contains text "Reference number"
    And Assert element by contains text "Payment date"
    And Assert payment date is todays date and in valid date format in Domestic payment
    And Assert Calendar filter is shown
    And Assert element by contains text "Urgent payment"
    And Assert checkbox "Urgent payment" is checked "true"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    Then Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "paymentAmountKey" is displayed
    And Assert element by contains text "Fee"

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Debtor"
    And Assert element by contains text "Name"
#    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text "Address"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert text under key "keyName" is displayed
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by contains text from excel "<rowindex>" columnName "domestic_payment_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Payment details"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "Purpose code"
    And Assert element by contains text "Value date"
    And Assert element by contains text "Urgent payment"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"
    And Assert element by contains text "Success"
    And Assert element by contains class "nlb-icon icon-close"
    And Wait for element by contains text "Domestic payment"
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "4" is correct
    And Compare if current amount balance from key "IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "4" is correct

    #treba da ide u Past payments
    And Click on tab "Payments" from main sidebar
    And Click on normalized text "Past payments"
    And Assert text under key "keyPurpose" is displayed
    And Click on tab "My NLB" from main sidebar
    And Wait for element by text "Pay or transfer"
    And Wait for "2" seconds
    And Assert text under key "keyPurpose" is displayed
    And Assert text under key "keyName" is displayed

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_Internal_Urgent_Payment_[WEB]
  Scenario Outline: Payments_Domestic_Payments_Internal_Urgent_Payment_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains class "subheadline bold" ends with "RSD"

    And Assert element by contains text "Account number"
    And Enter text "205-9001007790944-88" into "Account number" input field and remember it under key "keyRecipientAccountNumber"
    And Assert element by contains text "Name"
    And Enter random text into "Name" input field and remember it under key "keyRecipientName"
    And Assert element by contains text "Street and street number"
    And Enter text "nova 55" into "street" input field and remember it under key "keyStreet"
    And Assert element by contains text "City"
    And Enter text "bor" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Payment amount"
    And Enter text "1" into Payment amount input field and remember it under key "keyPaymentAmount"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by contains text "Purpose code"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"
    And Assert element by contains text "Purpose"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"
    And Assert checkbox "Urgent payment" is checked "True"

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

     #PAYMENT REVIEW
    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert element with text "Fee" with following sibling has text "0,00 RSD"
    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyRecipientName"
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccountNumber"

    And Assert element with text "Purpose" with following sibling has text under key "keyPurpose"
    And Assert element with text "Purpose code" with following sibling has text "289"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by contains text "Urgent payment"
    And Assert element by contains text "Payments_Wizard_Domestic"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on element by containing text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "1.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for element by contains text "Domestic payment"
    And Assert Past payments tab is selected in Payments
    And Wait for "1" seconds
    And Refresh page
    And Wait for first past payment

    And Assert first past or upcoming payment has purpose under key "keyPurpose"
    And Assert first past payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has name from key "keyRecipientName"
    And Assert first past or upcoming payment has today date

    And Click on element with text from key "keyRecipientName"
    And Assert label "Recipient" in payment confirmation has value under remembered key "keyRecipientName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyCity"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyStreet"
    And Assert label "Recipient account number" in payment confirmation has value under remembered key "keyRecipientAccountNumber"
    And Assert field "Purpose code" in payment confirmation has text "289"
    And Assert field "Purpose" in payment confirmation has text from key "keyPurpose"
    And Assert field "Payment date" in payment confirmation has valid date displayed
    And Assert field "Execution date" in payment confirmation has valid date displayed
    And Assert field "Name" in payment confirmation has text from key "keyDebtorFullName"

    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
#    And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
#    And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Payment status" in payment confirmation has text "Executed"
    And Assert field "Fee" in payment confirmation contains text "0,00"
    And Assert field "Fee" in payment confirmation contains text "RSD"
    And Assert field "Order number" in payment confirmation match regex "^[a-zA-Z0-9]{14}$"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "1" is correct
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "1" is correct

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_Internal_Non_Urgent_Payment_[WEB]
  Scenario Outline: Payments_Domestic_Payments_Internal_Non_Urgent_Payment_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains class "subheadline bold" ends with "RSD"

    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed
    And Enter text "205-9001007790944-88" into "Account number" input field and remember it under key "keyRecipientAccountNumber"
    And Enter random text into "Name" input field and remember it under key "keyRecipientName"
    And Assert element by contains text "Street and street number"
    And Enter text "niska 55" into "street" input field and remember it under key "keyStreet"
    And Enter text "Irig" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Payment amount"
    And Enter text "6" into Payment amount input field and remember it under key "keyPaymentAmount"
    And Assert element by tag "input" contains aria label "RSD"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"
    And Assert element by contains text "Model"
    And Assert element by contains text "Reference number"
    And Assert payment date is todays date and in valid date format in Domestic payment

    And Click on normalized text "Urgent payment"
    And Assert checkbox "Urgent payment" is checked "False"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

      ### PAYMENT REVIEW UI ###
    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert that text "Fee" has first following sibling that contains text "0,00 RSD"
    And Assert element by contains text "Debtor"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Payment details"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyRecipientName"
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccountNumber"

    And Assert element with text "Purpose" with following sibling has text under key "keyPurpose"
    And Assert element with text "Purpose code" with following sibling has text "289"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on element by containing text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "6.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for element by contains text "Domestic payment"
    And Click on normalized text "Upcoming payments"
    And Refresh page
    And Wait for "1" seconds
    And Wait for first past payment

    And Assert first past or upcoming payment has purpose under key "keyPurpose"
    And Assert first upcoming payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has name from key "keyRecipientName"
    And Assert first past or upcoming payment has today date

    And Click on normalized text from key "keyRecipientName"
    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyRecipientName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyCity"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyStreet"
    And Assert label "Recipient account number" in payment confirmation has value under remembered key "keyRecipientAccountNumber"
    And Assert field "Purpose code" in payment confirmation has text "289"
    #And Assert label "Debtor name" in payment confirmation contains value from excel "<rowindex>" columnName "username"
    And Assert field "Name" in payment confirmation has text from key "keyDebtorFullName"

    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
#    And Assert label "Debtor address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
#    And Assert label "Debtor address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Payment status" in payment confirmation has text "Pending"
    And Assert field "Order number" in payment confirmation match regex "^[a-zA-Z0-9]{14}$"
    And Wait for "60" seconds

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Refresh page
    And Wait for first product to load
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "0" is correct
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "0" is correct

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_External_Urgent_Payment_No_Model_[WEB]
  Scenario Outline: Payments_Domestic_Payments_External_Urgent_Payment_No_Model_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains class "subheadline bold" ends with "RSD"

    And Assert element by contains text "Account number"
    And Enter text "170-0010371461000-09" into "Account number" input field and remember it under key "keyRecipientAccountNumber"
    And Enter random text into "Name" input field and remember it under key "keyRecipientName"
    And Assert element by contains text "Street and street number"
    And Enter text "stara 552" into "street" input field and remember it under key "keyStreet"
    And Enter text "bor" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Enter text "3" into Payment amount input field and remember it under key "keyPaymentAmount"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by contains text "Purpose code"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"

    And Assert element by contains text "Model"
    And Assert element by contains text "Reference number"
    And Assert payment date is todays date and in valid date format in Domestic payment
    And Assert checkbox "Urgent payment" is checked "True"

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

      #PAYMENT REVIEW
    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert that fee in payment review has value from Excel "<rowindex>" columnName "fee_RSD_Clean"

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Payment details"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyRecipientName"
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccountNumber"

    And Assert element with text "Purpose" with following sibling has text under key "keyPurpose"
    And Assert element with text "Purpose code" with following sibling has text "289"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by contains text "Urgent payment"
    And Assert element by contains text "Payments_Wizard_Domestic"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on element by containing text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "3.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for element by contains text "Domestic payment"
    And Wait for "1" seconds
    And Refresh page
    And Wait for first past payment

    And Assert first past or upcoming payment has purpose under key "keyPurpose"
    And Assert first past payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has name from key "keyRecipientName"
    And Assert first past or upcoming payment has today date
    And Click on normalized text from key "keyRecipientName"
    And Assert label "Recipient" in payment confirmation has value under remembered key "keyRecipientName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyCity"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyStreet"
    And Assert label "Recipient account number" in payment confirmation has value under remembered key "keyRecipientAccountNumber"
    And Assert field "Urgent" in payment confirmation has text "Yes"
    And Assert field "Purpose code" in payment confirmation has text "289"
    And Assert field "Purpose" in payment confirmation has text from key "keyPurpose"
    And Assert field "Payment date" in payment confirmation has valid date displayed
    And Assert field "Execution date" in payment confirmation has valid date displayed
    And Assert field "Order number" in payment confirmation match regex "^[a-zA-Z0-9]{14}$"
    And Assert field "Name" in payment confirmation has text from key "keyDebtorFullName"

    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
##    And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
##    And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Payment status" in payment confirmation has text "Executed"
    And Assert that fee in payment details has value from Excel "<rowindex>" columnName "fee_With_Space_RSD"
    And Assert field "Payment status" in payment confirmation contains text "Executed"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load

    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" is reduced for amount from key "keyPaymentAmount" and fee from Excel "<rowindex>" columnName "fee_RSD_Clean"
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" is reduced for amount from key "keyPaymentAmount" and fee from Excel "<rowindex>" columnName "fee_RSD_Clean"

    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Assert element by contains class "heading-5 medium tw-text-gray-100" contains value from key "keyPurpose" is displayed
    And Assert text under key "keyPaymentAmount" is displayed
    And Assert text under key "keyRecipientName" is displayed
    And Click on down arrow on first transaction do display details
    And Assert element by text "Account number" has following sibling "dd" that contains text from key "keyRecipientAccountNumber"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_External_Urgent_Payment_Model11_Invalid_Bez_Poziva_Na_Broj_[WEB]
  Scenario Outline: Payments_Domestic_Payments_External_Urgent_Payment_Model11_Invalid_Bez_Poziva_Na_Broj_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Check data and choose “Next”"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Select from list or enter recipient data."
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains class "subheadline bold" ends with "RSD"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Assert element by contains text "Account number"
    And Enter text "170-0010371461000-09" into "Account number" input field
    And Enter text "pera" into "Name" input field
    And Assert element by contains text "Street and street number"
    And Enter text "nova 444" into "street" input field
    And Enter text "beograd" into "City" input field

    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Payment amount"
    And Enter text "3" in field by contains id "amount-input"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by contains text "Purpose code"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"

    And Enter text "QSSSSDDDD" into "Purpose" input field
    And Assert element by contains text "Model"
    And Select payment model "11" from dropdown
    And Assert element by label contains text "Model" with following sibling "div" that has descendant "input" has text "11"
    And Assert element by contains text "Reference number"
    And Assert payment date is todays date and in valid date format in Domestic payment
    And Assert checkbox "Urgent payment" is checked "True"

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    Then Wait for element by contains text "Neispravan poziv na broj  za model 11"
    And Assert element by contains text "Error"
    And Assert element by contains class "alert-triangle" is displayed
    And Assert element by contains text "OK"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_External_Non_Urgent_Payment_Model11_[WEB]
  Scenario Outline: Payments_Domestic_Payments_External_Non_Urgent_Payment_Model11_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains class "subheadline bold" ends with "RSD"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Enter text "200-2206180101000-48" into "Account number" input field and remember it under key "keyRecipientAccountNumber"
    And Enter random text into "Name" input field and remember it under key "keyRecipientName"
    And Assert element by contains text "Street and street number"
    And Enter text "niska 55" into "street" input field and remember it under key "keyStreet"
    And Enter text "Irig" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Payment amount"
    And Enter text "2" into Payment amount input field and remember it under key "keyPaymentAmount"
    And Assert element by tag "input" contains aria label "RSD"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"

    And Assert element by contains text "Purpose"
    And Assert element by contains text "Model"
    And Select payment model "11" from dropdown and remember it under key "keyPaymentModel"
    And Assert element by label contains text "Model" with following sibling "div" that has descendant "input" has text "11"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"
    And Enter text "801240107032-25119-1" into "Reference number" input field and remember it under key "keyReferenceNumber"
    And Assert payment date is todays date and in valid date format in Domestic payment

    And Click on normalized text "Urgent payment"
    And Assert checkbox "Urgent payment" is checked "False"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert that fee in payment review has value from Excel "<rowindex>" columnName "fee_RSD_Clean"
    And Assert element by contains text "Debtor"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Payment details"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyRecipientName"
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccountNumber"

    And Assert element with text "Purpose" with following sibling contains text under key "keyPurpose"
    And Assert element with text "Purpose code" with following sibling has text "289"
    And Assert value date is todays date and in valid date format in Payment review
    And Assert element with text "Reference number" with following sibling contains text under key "keyReferenceNumber"

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on element by containing text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "2.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for element by contains text "Domestic payment"
    And Click on normalized text "Upcoming payments"
    And Wait for first past payment
    And Wait for "1" seconds
    And Refresh page
    And Wait for first past payment

    And Assert first past or upcoming payment has purpose under key "keyPurpose"
    And Assert first upcoming payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has name from key "keyRecipientName"
    And Assert first past or upcoming payment has today date

    And Click on normalized text from key "keyRecipientName"
    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyRecipientName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyCity"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyStreet"
    And Assert label "Recipient account number" in payment confirmation has value under remembered key "keyRecipientAccountNumber"
    And Assert field "Purpose code" in payment confirmation has text "289"
    And Assert field "Order number" in payment confirmation match regex "^[a-zA-Z0-9]{14}$"
    And Assert label "Reference" in payment confirmation contains value under remembered key "keyReferenceNumber"
    And Assert label "Model" in payment confirmation contains value under remembered key "keyPaymentModel"

    And Assert field "Name" in payment confirmation has text from key "keyDebtorFullName"
    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Payment status" in payment confirmation has text "Pending"
    And Wait for "45" seconds
    And Refresh page
    And Wait for "5" seconds
    And Wait for first past payment
    And Assert first past or upcoming payment has purpose from key "keyPurpose"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "0" is correct
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "0" is correct

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_External_Urgent_Payment_Model97_Invalid_Bez_Poziva_Na_Broj_[WEB]
  Scenario Outline: Payments_Domestic_Payments_External_Urgent_Payment_Model97_Invalid_Bez_Poziva_Na_Broj_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Check data and choose “Next”"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Select from list or enter recipient data."
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Enter text "170-0010371461000-09" into "Account number" input field
    And Enter text "pera" into "Name" input field
    And Assert element by contains text "Street and street number"
    And Enter text "nova 2322" into "street" input field
    And Enter text "beograd" into "City" input field
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Payment amount"
    And Enter text "3" in field by contains id "amount-input"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by contains text "Purpose code"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"
    And Enter text "qwertyui" into "Purpose" input field

    And Assert element by contains text "Purpose"
    And Assert element by contains text "Model"
    And Select payment model "97" from dropdown
    And Assert element by label contains text "Model" with following sibling "div" that has descendant "input" has text "97"
    And Assert element by contains text "Reference number"

    And Assert payment date is todays date and in valid date format in Domestic payment
    And Assert checkbox "Urgent payment" is checked "True"

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    Then Wait for element by contains text "Neispravan poziv na broj  za model 97"
    And Assert element by contains text "Error"
    And Assert element by contains class "alert-triangle" is displayed
    And Assert element by contains text "OK"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_External_Non_Urgent_Payment_Model97_[WEB]
  Scenario Outline: Payments_Domestic_Payments_External_Non_Urgent_Payment_Model97_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains class "subheadline bold" ends with "RSD"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Assert element by contains text "Account number"
    And Enter text "265-1110312345678-24" into "Account number" input field and remember it under key "keyRecipientAccountNumber"
    And Enter random text into "Name" input field and remember it under key "keyRecipientName"
    And Assert element by contains text "Street and street number"
    And Enter text "niska 55" into "street" input field and remember it under key "keyStreet"
    And Enter text "Irig" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Payment amount"
    And Enter text "5" into Payment amount input field and remember it under key "keyPaymentAmount"
    And Assert element by tag "input" contains aria label "RSD"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"

    And Assert element by contains text "Model"
    And Select payment model "97" from dropdown and remember it under key "keyPaymentModel"
    And Assert element by label contains text "Model" with following sibling "div" that has descendant "input" has text "97"
    And Assert element by contains text "Reference number"
    And Enter text "30600268000161" into "Reference number" input field and remember it under key "keyReferenceNumber"
    And Assert payment date is todays date and in valid date format in Domestic payment

    And Click on normalized text "Urgent payment"
    And Assert checkbox "Urgent payment" is checked "False"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert that fee in payment review has value from Excel "<rowindex>" columnName "fee_RSD_Clean"
    And Assert element by contains text "Debtor"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Payment details"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyRecipientName"
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccountNumber"

    And Assert element with text "Purpose" with following sibling contains text under key "keyPurpose"
    And Assert element with text "Purpose code" with following sibling has text "289"
    And Assert value date is todays date and in valid date format in Payment review
    And Assert element with text "Reference number" with following sibling contains text under key "keyReferenceNumber"

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on element by containing text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "5.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for element by contains text "Domestic payment"
    And Click on normalized text "Upcoming payments"
    And Wait for "1" seconds
    And Refresh page
    And Wait for first past payment

    And Assert first past or upcoming payment has purpose under key "keyPurpose"
    And Assert first upcoming payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has name from key "keyRecipientName"
    And Assert first past or upcoming payment has today date
    And Click on normalized text from key "keyRecipientName"

    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyRecipientName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyCity"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyStreet"
    And Assert label "Recipient account number" in payment confirmation has value under remembered key "keyRecipientAccountNumber"
    And Assert field "Purpose code" in payment confirmation has text "289"
    And Assert field "Order number" in payment confirmation match regex "^[a-zA-Z0-9]{14}$"
    And Assert label "Reference" in payment confirmation contains value under remembered key "keyReferenceNumber"
    And Assert label "Model" in payment confirmation contains value under remembered key "keyPaymentModel"
    And Assert field "Name" in payment confirmation has text from key "keyDebtorFullName"

    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    #And Assert label "Debtor address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert label "Debtor address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Payment status" in payment confirmation has text "Pending"
    And Wait for "45" seconds
    And Refresh page
    And Wait for "5" seconds
    And Wait for first past payment
    And Assert first past or upcoming payment has purpose from key "keyPurpose"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "0" is correct
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "0" is correct
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Assert element by contains class "heading-5 medium tw-text-gray-100" contains value from key "keyPurpose" is displayed
    And Assert text under key "keyPaymentAmount" is displayed
    And Assert text under key "keyRecipientName" is displayed
    And Assert element by contains text "provizija"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_Budzetski_Urgent_Payment_Purpose_Code_289_Invalid_[WEB]
  Scenario Outline: Payments_Domestic_Payments_Budzetski_Urgent_Payment_Purpose_Code_289_Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Check data and choose “Next”"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Select from list or enter recipient data."
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains class "subheadline bold" ends with "RSD"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Assert element by contains text "Account number"
    And Enter text "840-0000713121843-57" into "Account number" input field
    And Enter text "zika" into "Name" input field
    And Assert element by contains text "Street and street number"
    And Enter text "nova 555" into "street" input field
    And Assert element by contains text "City"
    And Enter text "nis" into "City" input field
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Payment amount"
    And Enter text "3" in field by contains id "amount-input"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by contains text "Purpose code"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"
    And Enter text "ZXCVBVBBNM" into "Purpose" input field

    And Assert element by contains text "Purpose"
    And Assert element by contains text "Model"
    And Select payment model "97" from dropdown
    And Assert element by label contains text "Model" with following sibling "div" that has descendant "input" has text "97"
    And Assert element by contains text "Reference number"
    And Enter text "020201701973791828" into "Reference number" input field
    And Assert payment date is todays date and in valid date format in Domestic payment
    And Assert checkbox "Urgent payment" is checked "True"

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    Then Wait for element by contains text " Neispravna šifra plaćanja za račun 840000071312184357 !"
    And Assert element by contains text "Error"
    And Assert element by contains class "alert-triangle" is displayed
    And Assert element by contains text "OK"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_Budzetski_Urgent_Payment_Without_Reference_Number_Invalid_[WEB]
  Scenario Outline: Payments_Domestic_Payments_Budzetski_Urgent_Payment_Without_Reference_Number_Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Check data and choose “Next”"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Select from list or enter recipient data."
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains class "subheadline bold" ends with "RSD"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Enter text "840-0000713121843-57" into "Account number" input field
    And Enter text "zika" into "Name" input field
    And Assert element by contains text "Street and street number"
    And Enter text "nova 555" into "street" input field
    And Enter text "nis" into "City" input field
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Payment amount"
    And Enter text "3" in field by contains id "amount-input"
    And Assert element by tag "input" contains aria label "RSD"
    And Click on normalized text "Purpose code"
    And Wait for element by contains text "253"
    And Click on normalized text "253 - PAYMENT OF PUBLIC REVENUES EXCEPT TAXES AND CONTRIBUTIONS WITHHELD AT SOURCE"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "253"
    And Enter text "ZXCVBVBBNM" into "Purpose" input field

    And Assert element by contains text "Purpose"
    And Assert element by contains text "Model"
    And Select payment model "97" from dropdown
    And Assert element by label contains text "Model" with following sibling "div" that has descendant "input" has text "97"
    And Assert element by contains text "Reference number"
    And Assert payment date is todays date and in valid date format in Domestic payment
    And Assert checkbox "Urgent payment" is checked "True"

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    Then Wait for element by contains text " Neispravan poziv na broj za račun 840000071312184357 !"
    And Assert element by contains text "Error"
    And Assert element by contains class "alert-triangle" is displayed
    And Assert element by contains text "OK"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_Budzetski_Urgent_Payment_Model97_[WEB]
  Scenario Outline: Payments_Domestic_Payments_Budzetski_Urgent_Payment_Model97_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Recipient"
    And Assert element by contains class "subheadline bold" ends with "RSD"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Enter text "840-0000713121843-57" into "Account number" input field and remember it under key "keyRecipientAccountNumber"
    And Enter random text into "Name" input field and remember it under key "keyRecipientName"
    And Assert element by contains text "Street and street number"
    And Enter text "nova 55" into "street" input field and remember it under key "keyStreet"
    And Enter text "bor" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment amount"
    And Enter text "1" into Payment amount input field and remember it under key "keyPaymentAmount"
    And Assert element by tag "input" contains aria label "RSD"

    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"
    And Click on normalized text "Purpose code"
    And Click on normalized text "253 - PAYMENT OF PUBLIC REVENUES EXCEPT TAXES AND CONTRIBUTIONS WITHHELD AT SOURCE"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "253"

    And Assert element by contains text "Purpose"
    And Assert element by contains text "Model"
    And Select payment model "97" from dropdown and remember it under key "keyPaymentModel"
    And Assert element by label contains text "Model" with following sibling "div" that has descendant "input" has text "97"
    And Enter text "020201701973791828" into "Reference number" input field and remember it under key "keyReferenceNumber"
    And Assert payment date is todays date and in valid date format in Domestic payment
    And Assert checkbox "Urgent payment" is checked "True"

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

      #PAYMENT REVIEW
    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert that fee in payment review has value from Excel "<rowindex>" columnName "fee_RSD_Clean"
    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Payment details"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyRecipientName"
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccountNumber"

    And Assert element with text "Purpose" with following sibling has text under key "keyPurpose"
    And Assert element with text "Purpose code" with following sibling has text "253"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by contains text "Urgent payment"
    And Assert element by contains text "Payments_Wizard_Domestic"
    And Assert element with text "Reference number" with following sibling has text under key "keyReferenceNumber"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on element by containing text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "1.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for element by contains text "Domestic payment"
    And Assert Past payments tab is selected in Payments
    And Wait for "2" seconds
    And Refresh page
    And Wait for first past payment

    And Assert first past or upcoming payment has purpose under key "keyPurpose"
    And Assert first past payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has name from key "keyRecipientName"
    And Assert first past or upcoming payment has today date

    And Click on normalized text from key "keyRecipientName"
    And Assert label "Recipient" in payment confirmation has value under remembered key "keyRecipientName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyCity"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyStreet"
    And Assert label "Recipient account number" in payment confirmation has value under remembered key "keyRecipientAccountNumber"
    And Assert label "Model" in payment confirmation contains value under remembered key "keyPaymentModel"
    And Assert label "Reference" in payment confirmation contains value under remembered key "keyReferenceNumber"
    And Assert field "Urgent" in payment confirmation has text "Yes"
    And Assert field "Purpose code" in payment confirmation has text "253"
    And Assert field "Payment date" in payment confirmation has valid date displayed
    And Assert field "Execution date" in payment confirmation has valid date displayed
    And Assert field "Order number" in payment confirmation match regex "^[a-zA-Z0-9]{14}$"

    And Assert field "Debtor name" in payment confirmation has text from key "keyDebtorFullName"
    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Payment status" in payment confirmation has text "Executed"
    And Assert that fee in payment details has value from Excel "<rowindex>" columnName "fee_With_Space_RSD"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" is reduced for amount from key "keyPaymentAmount" and fee from Excel "<rowindex>" columnName "fee_RSD_Clean"
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" is reduced for amount from key "keyPaymentAmount" and fee from Excel "<rowindex>" columnName "fee_RSD_Clean"

    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Assert element by contains class "heading-5 medium tw-text-gray-100" contains value from key "keyPurpose" is displayed
    And Assert text under key "keyPaymentAmount" is displayed
    And Assert text under key "keyRecipientName" is displayed
    And Click on down arrow on first transaction do display details
    And Assert element by text "Account number" has following sibling "dd" that contains text from key "keyRecipientAccountNumber"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_Budzetski_Non_Urgent_Payment_Model97_[WEB]
  Scenario Outline: Payments_Domestic_Payments_Budzetski_Non_Urgent_Payment_Model97_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load

    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Enter text "840-0000713121843-57" into "Account number" input field and remember it under key "keyRecipientAccountNumber"
    And Enter random text into "Name" input field and remember it under key "keyRecipientName"
    And Assert element by contains text "Street and street number"
    And Enter text "niska 55" into "street" input field and remember it under key "keyStreet"
    And Enter text "Irig" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Payment amount"
    And Enter text "2" into Payment amount input field and remember it under key "keyPaymentAmount"
    And Assert element by tag "input" contains aria label "RSD"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"
    And Click on normalized text "Purpose code"
    And Click on normalized text "253 - PAYMENT OF PUBLIC REVENUES EXCEPT TAXES AND CONTRIBUTIONS WITHHELD AT SOURCE"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "253"

    And Assert element by contains text "Purpose"
    And Assert element by contains text "Model"
    And Select payment model "97" from dropdown and remember it under key "keyPaymentModel"
    And Assert element by label contains text "Model" with following sibling "div" that has descendant "input" has text "97"
    And Assert element by contains text "Reference number"
    And Enter text "020201701973791828" into "Reference number" input field and remember it under key "keyReferenceNumber"
    And Assert payment date is todays date and in valid date format in Domestic payment

    And Click on normalized text "Urgent payment"
    And Assert checkbox "Urgent payment" is checked "False"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    ### PAYMENT REVIEW UI ###
    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert that fee in payment review has value from Excel "<rowindex>" columnName "fee_RSD_Clean"
    And Assert element by contains text "Debtor"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Payment details"
    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyRecipientName"
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccountNumber"

    And Assert element with text "Purpose" with following sibling contains text under key "keyPurpose"
    And Assert element with text "Purpose code" with following sibling has text "253"
    And Assert value date is todays date and in valid date format in Payment review
    And Assert element with text "Reference number" with following sibling contains text under key "keyReferenceNumber"

    And Assert element by contains text "Confirm"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on element by containing text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "2.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for element by contains text "Domestic payment"
    And Click on normalized text "Upcoming payments"
    And Wait for "2" seconds
    And Refresh page
    And Wait for first past payment

    And Assert first past or upcoming payment has purpose under key "keyPurpose"
    And Assert first upcoming payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has name from key "keyRecipientName"
    And Assert first past or upcoming payment has today date

    And Click on normalized text from key "keyRecipientName"
    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyRecipientName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyCity"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyStreet"
    And Assert label "Recipient account number" in payment confirmation has value under remembered key "keyRecipientAccountNumber"
    And Assert field "Purpose code" in payment confirmation has text "253"
    And Assert field "Order number" in payment confirmation match regex "^[a-zA-Z0-9]{14}$"
    And Assert label "Reference" in payment confirmation contains value under remembered key "keyReferenceNumber"
    And Assert label "Model" in payment confirmation contains value under remembered key "keyPaymentModel"
    And Assert field "Name" in payment confirmation has text from key "keyDebtorFullName"
    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Payment status" in payment confirmation has text "Pending"
    And Wait for "45" seconds
    And Refresh page
    And Wait for "5" seconds
    And Wait for first past payment
    And Assert first past or upcoming payment has purpose from key "keyPurpose"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "0" is correct
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "0" is correct

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_External_Urgent_Payment_Model97_[WEB]
  Scenario Outline: Payments_Domestic_Payments_External_Urgent_Payment_Model97_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"

    And Click on tag "nlb-account-selector"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Recipient"
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Assert element by contains text "Account number"
    And Enter text "265-1110312345678-24" into "Account number" input field and remember it under key "keyRecipientAccountNumber"
    And Enter random text into "Name" input field and remember it under key "keyRecipientName"
    And Assert element by contains text "Street and street number"
    And Enter text "nova 55" into "street" input field and remember it under key "keyStreet"
    And Enter text "bor" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Enter text "2" into Payment amount input field and remember it under key "keyPaymentAmount"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"

    And Select payment model "97" from dropdown and remember it under key "keyPaymentModel"
    And Assert element by label contains text "Model" with following sibling "div" that has descendant "input" has text "97"
    And Enter text "30600268000161" into "Reference number" input field and remember it under key "keyReferenceNumber"
    And Assert payment date is todays date and in valid date format in Domestic payment
    And Assert checkbox "Urgent payment" is checked "True"

    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

      #PAYMENT REVIEW
    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    #And Assert element with text "Fee" with following sibling has text "0,00 RSD"
    And Assert that fee in payment review has value from Excel "<rowindex>" columnName "fee_RSD_Clean"
    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Payment details"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyRecipientName"
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccountNumber"

    And Assert element with text "Purpose" with following sibling has text under key "keyPurpose"
    And Assert element with text "Purpose code" with following sibling has text "289"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by contains text "Urgent payment"
    And Assert element by contains text "Payments_Wizard_Domestic"
    And Assert element with text "Reference number" with following sibling has text under key "keyReferenceNumber"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on element by containing text "Confirm"

    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "2.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for element by contains text "Domestic payment"
    And Assert Past payments tab is selected in Payments
    And Wait for "1" seconds
    And Refresh page
    And Wait for first past payment

    And Assert first past or upcoming payment has purpose under key "keyPurpose"
    And Assert first past payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has name from key "keyRecipientName"
    And Assert first past or upcoming payment has today date
    And Click on normalized text from key "keyRecipientName"
    And Assert label "Recipient" in payment confirmation has value under remembered key "keyRecipientName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyCity"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyStreet"
    And Assert label "Recipient account number" in payment confirmation has value under remembered key "keyRecipientAccountNumber"
    And Assert field "Purpose code" in payment confirmation has text "289"
    And Assert label "Model" in payment confirmation contains value under remembered key "keyPaymentModel"
    And Assert label "Reference" in payment confirmation contains value under remembered key "keyReferenceNumber"
    And Assert field "Payment date" in payment confirmation has valid date displayed
    And Assert field "Execution date" in payment confirmation has valid date displayed
    And Assert field "Order number" in payment confirmation match regex "^[a-zA-Z0-9]{14}$"

    And Assert field "Name" in payment confirmation has text from key "keyDebtorFullName"
    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Payment status" in payment confirmation has text "Executed"
    And Assert that fee in payment details has value from Excel "<rowindex>" columnName "fee_With_Space_RSD"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" is reduced for amount from key "keyPaymentAmount" and fee from Excel "<rowindex>" columnName "fee_RSD_Clean"
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" is reduced for amount from key "keyPaymentAmount" and fee from Excel "<rowindex>" columnName "fee_RSD_Clean"

    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Assert element by contains class "heading-5 medium tw-text-gray-100" contains value from key "keyPurpose" is displayed
    And Assert text under key "keyPaymentAmount" is displayed
    And Assert text under key "keyRecipientName" is displayed
    And Click on down arrow on first transaction do display details
    And Assert element by text "Account number" has following sibling "dd" that contains text from key "keyRecipientAccountNumber"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_External_Urgent_Payment_Model11_[WEB]
  Scenario Outline: Payments_Domestic_Payments_External_Urgent_Payment_Model11_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Check data and choose “Next”"
    And Assert element by contains text "Recipient"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Assert element by contains text "Account number"
    And Enter text "200-2206180101000-48" into "Account number" input field and remember it under key "keyRecipientAccountNumber"
    And Enter random text into "Name" input field and remember it under key "keyRecipientName"
    And Assert element by contains text "Street and street number"
    And Enter text "nova 55" into "street" input field and remember it under key "keyStreet"
    And Enter text "bor" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Payment amount"
    And Enter text "1" into Payment amount input field and remember it under key "keyPaymentAmount"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"

    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"
    And Select payment model "11" from dropdown and remember it under key "keyPaymentModel"
    And Assert element by label contains text "Model" with following sibling "div" that has descendant "input" has text "11"
    And Enter text "801240107032-25119-1" into "Reference number" input field and remember it under key "keyReferenceNumber"
    And Assert payment date is todays date and in valid date format in Domestic payment
    And Assert checkbox "Urgent payment" is checked "True"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

      #PAYMENT REVIEW
    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert that fee in payment review has value from Excel "<rowindex>" columnName "fee_RSD_Clean"
    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Payment details"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyRecipientName"
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccountNumber"

    And Assert element with text "Purpose" with following sibling has text under key "keyPurpose"
    And Assert element with text "Purpose code" with following sibling has text "289"
    And Assert value date is todays date and in valid date format in Payment review

    And Assert element by contains text "Urgent payment"
    And Assert element by contains text "Payments_Wizard_Domestic"
    And Assert element with text "Reference number" with following sibling has text under key "keyReferenceNumber"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on element by containing text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "11.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for element by contains text "Domestic payment"
    And Assert Past payments tab is selected in Payments
    And Wait for "2" seconds
    And Refresh page
    And Wait for first past payment

    And Assert first past or upcoming payment has purpose under key "keyPurpose"
    And Assert first past payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has name from key "keyRecipientName"
    And Assert first past or upcoming payment has today date
    And Click on normalized text from key "keyRecipientName"
    And Assert label "Recipient" in payment confirmation has value under remembered key "keyRecipientName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyCity"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyStreet"
    And Assert label "Recipient account number" in payment confirmation has value under remembered key "keyRecipientAccountNumber"
    And Assert field "Purpose code" in payment confirmation has text "289"
    And Assert label "Model" in payment confirmation contains value under remembered key "keyPaymentModel"
    And Assert label "Reference" in payment confirmation contains value under remembered key "keyReferenceNumber"
    And Assert field "Payment date" in payment confirmation has valid date displayed
    And Assert field "Execution date" in payment confirmation has valid date displayed
    And Assert field "Order number" in payment confirmation match regex "^[a-zA-Z0-9]{14}$"
    And Assert field "Debtor name" in payment confirmation has text from key "keyDebtorFullName"

    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Payment status" in payment confirmation has text "Executed"
    And Assert that fee in payment details has value from Excel "<rowindex>" columnName "fee_With_Space_RSD"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" is reduced for amount from key "keyPaymentAmount" and fee from Excel "<rowindex>" columnName "fee_RSD_Clean"
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" is reduced for amount from key "keyPaymentAmount" and fee from Excel "<rowindex>" columnName "fee_RSD_Clean"

    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Assert element by contains class "heading-5 medium tw-text-gray-100" contains value from key "keyPurpose" is displayed
    And Assert text under key "keyPaymentAmount" is displayed
    And Assert text under key "keyRecipientName" is displayed
    And Click on down arrow on first transaction do display details
    And Assert element by text "Account number" has following sibling "dd" that contains text from key "keyRecipientAccountNumber"
    And Assert amount in transaction details has value under key "keyPaymentAmount" in currency "RSD"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Value date" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Domestic_Payments_External_Non_Urgent_Payment_No_Model_[WEB]
  Scenario Outline: Payments_Domestic_Payments_External_Non_Urgent_Payment_No_Model_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "keyDebtorFullName"

    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Available_Balance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "key_IT_001_Debtor_Current_Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains class "subheadline bold" ends with "RSD"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    And Assert element by contains text "Account number"
    And Enter text "265-1110312345678-24" into "Account number" input field and remember it under key "keyRecipientAccountNumber"
    And Assert element by contains text "Name"
    And Enter random text into "Name" input field and remember it under key "keyRecipientName"
    And Assert element by contains text "Street and street number"
    And Enter text "rumska 2255" into "street" input field and remember it under key "keyStreet"
    And Assert element by contains text "City"
    And Enter text "vrdnik" into "City" input field and remember it under key "keyCity"
    And Assert element by contains text "Save recipient"
    And Assert checkbox "Save recipient" is checked "false"

    And Assert element by contains text "Payment"
    And Assert element by contains text "Payment amount"
    And Enter text "2" into Payment amount input field and remember it under key "keyPaymentAmount"
    And Assert element by tag "input" contains aria label "RSD"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"

    And Assert element by contains text "Model"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"
    And Enter text "30600268000161" into "Reference number" input field and remember it under key "keyReferenceNumber"
    And Assert payment date is todays date and in valid date format in Domestic payment

    And Click on normalized text "Urgent payment"
    And Assert checkbox "Urgent payment" is checked "False"
    And Assert element by contains text "Back"
    And Click on element by containing text "Confirm"

    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "keyPaymentAmount" is displayed
    And Assert that fee in payment review has value from Excel "<rowindex>" columnName "fee_RSD_Clean"
    And Assert element by contains text "Debtor"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Payment details"

    And Assert element by text "Name" and index "1" has first following sibling that contains text from key "keyDebtorFullName"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert element by text "Address" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert element by text "Account number" and index "1" has first following sibling that contains text from Excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by text "Name" and index "2" has first following sibling that contains text from key "keyRecipientName"
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by text "Account number" and index "2" has first following sibling that contains text from key "keyRecipientAccountNumber"

    And Assert element with text "Purpose" with following sibling contains text under key "keyPurpose"
    And Assert element with text "Purpose code" with following sibling has text "289"
    And Assert value date is todays date and in valid date format in Payment review
    And Assert element with text "Reference number" with following sibling contains text under key "keyReferenceNumber"

    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Click on element by containing text "Confirm"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "2.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    And Wait for element by contains text "Domestic payment"
    And Click on normalized text "Upcoming payments"
    And Wait for "1" seconds
    And Refresh page
    And Wait for first past payment

    And Assert first past or upcoming payment has purpose under key "keyPurpose"
    And Assert first upcoming payment has amount from key "keyPaymentAmount" in currency "RSD"
    And Assert first past or upcoming payment has name from key "keyRecipientName"
    And Assert first past or upcoming payment has today date

    And Click on normalized text from key "keyRecipientName"
    And Assert label "Recipient" in payment confirmation contains value under remembered key "keyRecipientName"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyCity"
    And Assert label "Recipient address" in payment confirmation contains value under remembered key "keyStreet"
    And Assert label "Recipient account number" in payment confirmation has value under remembered key "keyRecipientAccountNumber"
    And Assert field "Purpose code" in payment confirmation has text "289"
    And Assert field "Order number" in payment confirmation match regex "^[a-zA-Z0-9]{14}$"
    And Assert label "Reference" in payment confirmation contains value under remembered key "keyReferenceNumber"

    And Assert field "Name" in payment confirmation has text from key "keyDebtorFullName"
    And Assert label "Account number" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_street_for_payment_review"
    #And Assert label "Address" in payment confirmation contains value from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert field "Payment status" in payment confirmation has text "Pending"
    And Wait for "45" seconds
    And Refresh page
    And Wait for "5" seconds
    And Wait for first past payment
    And Assert first past or upcoming payment has purpose from key "keyPurpose"

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Compare if available amount balance from key "key_IT_001_Debtor_Available_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "0" is correct
    And Compare if current amount balance from key "key_IT_001_Debtor_Current_Balance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount "0" is correct

    Examples:
      | rowindex |
      |        5 |


