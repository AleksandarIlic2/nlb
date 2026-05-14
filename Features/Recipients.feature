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

    When Enter text "205-9001010537788-94" in "Account number" input field and remember under key "accountNumberKey"
    And Enter text "Enil" in "Name" input field and remember under key "nameKey"
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

    And Assert element by contains text "Success"
    And Assert element by contains text "Do you want to save payment data?"
    And Assert element by contains text "Close without saving"
    And Assert element by contains text "Save recipient"
    And Assert element by contains text "Save template"
    And Assert element by contains text "Save both"
    And Click on normalized text "Save recipient"
    And Assert element by contains text "Recipient saved"
    And Wait for element by contains text "Domestic payment"
    And Assert contains text under key "nameKey" is displayed
    And Assert contains text under key "purposeKey" is displayed
    And Click on element with text from key "purposeKey"
    And Assert contains text under key "accountNumberKey" is displayed
    And Assert contains text under key "nameKey" is displayed
    And Assert contains text under key "streetKey" is displayed
#    And Assert recipient city equals remembered key "cityKey"
#    And Assert contains text under key "cityKey" is displayed
    And Assert contains text under key "referenceNumberKey" is displayed
    And Assert contains text under key "purposeKey" is displayed
    And Assert payment status is "Executed"

    Then Click on tab "Recipients" from main sidebar
    And Wait for first recipient
    And Click on recipient name by key "nameKey"
    And Assert contains text under key "nameKey" is displayed
    And Assert contains text under key "streetKey" is displayed
#    And Assert contains text under key "cityKey" is displayed
    And Assert recipient city equals remembered key "cityKey"
    And Assert contains text under key "purposeKey" is displayed
    And Click on element by tag "span" containing text "Delete"
    And Click on element by tag "div" and text "Delete"

    Examples:
      | rowindex |
      |        4 |


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
      |        4 |


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
      |        1 |