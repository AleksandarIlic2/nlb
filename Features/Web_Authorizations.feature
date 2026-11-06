Feature: Web_Authorizations

  @Web_Authoizations_Successful_Authorization_Of_Payment_With_Confirmation_On_Mobile_[WEB]
  Scenario Outline: Web_Authoizations_Successful_Authorization_Of_Payment_With_Confirmation_On_Mobile_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
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
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "3.00" and currency "RSD" with message "Success"
    And Assert element by contains text "Success"

    Examples:
      | rowindex |
      |        5 |


  @Web_Authoizations_Rejection_Of_Payment_Confirmation_On_Mobile_[WEB]
  Scenario Outline: Web_Authoizations_Rejection_Of_Payment_Confirmation_On_Mobile_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Click on normalized text "Domestic payment"
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
    And Enter text "4" into Payment amount input field and remember it under key "paymentAmountKey"
    And Click on element by containing text "Confirm"

    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "paymentAmountKey" is displayed
    And Assert element by contains text "Fee"
    And Click on element by containing text "Confirm"

    Then Use mobile app to reject payment
    And Wait for element by contains text "Select from list"

    Examples:
      | rowindex |
      |        5 |