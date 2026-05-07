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
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Enter text "205-9001001539786-67" in "AccountNumber" input field and remember under key "accountNumberKey"
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
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Assert element by contains text "Recipient"
    And Assert "Name" element under key "nameKey" with index "2" is displayed
    And Assert address from keys "streetKey" and "cityKey" is displayed
    And Assert "Account number" element under key "accountNumberKey" with index "2" is displayed

    And Assert element by contains text "Payment"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "Purpose code"
    And Assert element by contains text "Reference number"
    And Assert "Reference number" element under key "referenceNumberKey" with index "1" is displayed
    And Assert element by contains text "Back"
    And Assert element by contains text "Confirm"
    And Click on element by containing text "Back"
    And Wait for element by contains text "Domestic payment"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Click on Recipient account selector in Domestic payment
    And Assert input field by contains text "AccountNumber" has value under remembered key "accountNumberKey"
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

    When Click on element by containing text "Payments"
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Check data and choose “Next”"
    And Assert element by contains text "Debtor"
    And Assert element by xPath "//nlb-account-selector"
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Select from list or enter recipient data."
    And Assert element by contains text "Select from list"

    And Assert element by contains text "AccountNumber"
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban" into "AccountNumber" input field
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
    And Enter text "0,1" into Payment amount input field and remember it under key "paymentAmountKey"
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
#    And Assert element by contains text "0,10 RSD"
    And Assert payment amount under key is "paymentAmountKey" is displayed
    And Assert element by contains text "Fee"

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Debtor"
    And Assert element by contains text "Name"
#    //And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text "Address"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by tag "dt" containing text "Name" with index "2"
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

    When Click on element by containing text "Payments"
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Assert element by contains text "Domestic payment"
    And Assert element by contains text "Check data and choose “Next”"
    And Assert element by contains text "Recipient"
    And Assert element by contains text "Select from list or enter recipient data."
    And Assert element by contains src "CurrentAccount-Icon" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
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
    And Assert element by contains text "AccountNumber"
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban" into "AccountNumber" input field
    And Assert element by contains text "Name"
    And Enter text "Ime Automatizacija Web" into "Name" input field and remember it under key "keyName"
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
    And Enter text "0,1" into Payment amount input field and remember it under key "paymentAmountKey"
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
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by tag "dt" containing text "Name" with index "2"
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

#    When Enter text "205-9001010537788-94" in "Account number" input field and remember under key "accountNumberKey"
    When Enter text "205-9001010537788-94" in "AccountNumber" input field and remember under key "accountNumberKey"
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
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Assert element by contains text "Recipient"
    And Assert "Name" element under key "nameKey" with index "2" is displayed
    And Assert address from keys "streetKey" and "cityKey" is displayed
    And Assert "Account number" element under key "accountNumberKey" with index "2" is displayed

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
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Assert text under key "accountNumberKey" is displayed
    And Assert recipient address contains values from keys "streetKey" and "cityKey"

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
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Click on normalized text "Select from list"
    And Assert element by contains text "Select template"
    #Lose spelovano. RECEPIENT umesto RECIPIENT. Padace kad ga isprave
    And Assert element by contains text "Select recipient"
    And Assert element by xPath "//nlb-search-box"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    #Lose spelovano. RECEPIENT umesto RECIPIENT. Padace kad ga isprave
    And Click on normalized text "Select recipient"
    And Assert element by xPath "//nlb-search-box"
    And Click on first recipient
    And Assert element by class "tw-items-center" containing text "Change recipient"
    And Assert element by contains text "AccountNumber"
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban" into "AccountNumber" input field
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
    And Enter text "0,1" into Payment amount input field and remember it under key "paymentAmountKey"
    And Assert element by tag "input" contains aria label "RSD"
    And Assert element by contains text "Purpose code"
    And Assert element by label contains text "Purpose code" with following sibling "div" that has descendant "input" has text "289"
    And Assert element by contains text "Purpose"
    And Enter text "Payment for services 2" into "Purpose" input field and remember it under key "keyPurpose"
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
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by tag "dt" containing text "Name" with index "2"
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
    And Wait for element by contains text "Domestic payment"

    #treba da ide u Past payments
    And Click on normalized text "Past payments"
    And Assert text under key "keyPurpose" is displayed
    And Click on tab "My NLB" from main sidebar
#    And Wait for element by text "Pay or transfer"
    And Wait for element by tag "nlb-dashboard-carousel"
    And Wait for "2" seconds
    And Assert text under key "keyPurpose" is displayed
    And Assert text under key "keyName" is displayed

    Examples:
      | rowindex |
      |        5 |


  @Payments-Domestic_Payments-Confirmation_[WEB]
  Scenario Outline: Payments-Domestic_Payments-Confirmation_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"

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
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Click on normalized text "Select from list"
    And Assert element by contains text "Select template"
    #Lose spelovano. RECEPIENT umesto RECIPIENT. Padace kad ga isprave
    And Assert element by contains text "Select recipient"
    And Assert element by xPath "//nlb-search-box"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    #Lose spelovano. RECEPIENT umesto RECIPIENT. Padace kad ga isprave
    And Click on normalized text "Select recipient"
    And Assert element by xPath "//nlb-search-box"
    And Click on first recipient
    And Assert element by class "tw-items-center" containing text "Change recipient"
    And Assert element by contains text "AccountNumber"
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban" into "AccountNumber" input field
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
    And Enter text "0,1" into Payment amount input field and remember it under key "paymentAmountKey"
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
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by tag "dt" containing text "Name" with index "2"
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

    #treba da ide u Past payments
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