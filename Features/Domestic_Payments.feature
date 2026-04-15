Feature: Domestic_Payments

#  @Payments-Domestic_Payments-Cancel_Button_[WEB]
#  Scenario Outline: Payments-Domestic_Payments-Cancel_Button_[WEB]
#
#    Given Open Login page
#    And Change language to English
#    And Login to the page using user from Excel "<rowindex>" columnName "username"
#    And Wait for element by text "Pay or transfer"
#
#    When Click on tab "Payments" from main sidebar
#    And Click on element by text "Domestic payment"
#    And Click on element by xpath "//nlb-account-selector"
#    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
#    And Enter text "Enil" in "First and last name" input field and remember under key "nameKey"
#    And Enter text "0,1" in "Payment amount" input field and remember under key "paymentAmountKey"
#    And Assert checkbox "Save recipient" is checked "false"
#    And Assert element by contains text "Payment date"
#    And Assert element by contains text "Urgent payment"
#    And Assert checkbox "Urgent payment" is checked "true"
##    And Assert element by contains text "Cancel"
#    And Assert element by contains text "Back"
#    And Assert element by contains text "Confirm"
#
#    And Click on element by containing text "Cancel"
#    And Assert element by contains text "Are you sure?"
#    And Assert element by contains text "Cancelling now will terminate the payment process."
#    And Assert element by contains text "No"
#    And Assert element by contains text "Yes"
#    And Click on element by containing text "No"
#
#    Then Assert element by contains text "Urgent payment"
#    And Enter text "205-9001010537788-94" in "AccountNumber" input field and remember under key "accountNumberKey"
#    And Enter text "Enil" in "First and last name" input field and remember under key "nameKey"
#    And Enter text "Kaludjerica" in "street" input field and remember under key "streetKey"
#    And Enter text "Beograd" in "City" input field and remember under key "cityKey"
#    And Enter text "0,1" in "Payment amount" input field and remember under key "paymentAmountKey"
#    And Assert checkbox "Save recipient" is checked "false"
#    And Enter text "75" in "Reference number" input field and remember under key "referenceNumberKey"
#    And Click on element by containing text "Confirm"
#    And Wait for element by contains text "Payment amount"
#    And Assert payment amount under key is "paymentAmountKey" is displayed
#
#    Examples:
#      | rowindex |
#      |        1 |

  @Payments-Domestic_Payments-Back_Button_[WEB]
  Scenario Outline: Payments-Domestic_Payments-Back_Button_[WEB]

#    Given Open Login page
#    And Change language to English
#    And Login to the page using user from Excel "<rowindex>" columnName "username"
#    When Wait for element by text "Pay or transfer"
#
#    And Click on tab "Payments" from main sidebar
#    And Click on element by text "Domestic payment"
#    And Click on element by containing text "Select from list"
#    And Click on element by xpath "//button//div[contains(text(),\"Select from list\")]"
#    And Click on element by containing class "tw-px-3 tw-cursor-pointer" with index "2"
#    #And Click on element by containing text " koar tgr "
#    And Enter amount "100"
#    And Assert element by contains text "Back"
#    And Assert element by contains text "Cancel"
#    And Assert element by contains text "Confirm"
#
#    And Click on element by containing text "Confirm"
#
#    And Remember recipient data
#    And Assert element by contains text "Back"
#    And Assert element by contains text "Cancel"
#    And Assert element by contains text "Confirm"
#
#    And Click on element by xpath "//button/div[contains(text(),'Back')]"
#    And Assert recipient data is correct

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
    When Click on element by xpath "//nlb-account-selector"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Enter text "205-9001010537788-94" in "AccountNumber" input field and remember under key "accountNumberKey"
    And Enter text "Enil" in "First and last name" input field and remember under key "nameKey"
    And Enter text "Kaludjerica 11" in "street" input field and remember under key "streetKey"
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
    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Assert element by contains text "Recipient"
    And Assert "First and last name" element under key "nameKey" with index "2" is displayed
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
    And Assert input field by contains text "First and last name" has value under remembered key "nameKey"
    And Assert input field by contains text "street" has value under remembered key "streetKey"
    And Assert input field by contains text "City" has value under remembered key "cityKey"
    And Assert input field by contains text "Payment amount" has value under remembered key "paymentAmountKey"
    And Assert input field by contains text "Reference number" has value under remembered key "referenceNumberKey"
    And Assert checkbox "Save recipient" is checked "false"
    And Assert checkbox "Urgent payment" is checked "true"

    Examples:
      | rowindex |
      |        1 |


  @Payments-Domestic_Payments-Create_New_Recipient_[WEB]
  Scenario Outline: Payments-Domestic_Payments-Create_New_Recipient_[WEB]

#    Given Open Login page
#    And Change language to English
#    And Login to the page using user from Excel "<rowindex>" columnName "username"
#    #TODO: Razmotriti da li ove podatke vuci iz eksela
#    When Click on element by text "Pay or transfer"
#    And Click on element by containing class "icon-chevron-down" with index "1"
#    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
#    And Enter text "205900100024380847" in field by xPath "//label[text()='Account number']/following-sibling::div//input"
#    And Enter text "KOAR TGR" in field by xPath "//label[contains(text(), 'name')]/following-sibling::div//input"
#    And Enter text "ULICAA" in field by xPath "//label[contains(text(), 'Street')]/following-sibling::div//input"
#    And Enter text "Beograd" in field by xPath "//label[text()='City']/following-sibling::div//input"
#    And Enter text "129" in field by xPath "//label[text()='Payment amount ']/following-sibling::div//input"
#    And Click on element by text "Save recipient "
#    And Enter random purpose into purpose field for internal payment in second payment screen and remember it under key "IT_001"
#
#    And Remember recipient number and name
#    Then Click on element by text " Confirm "
#    And Wait for element by text " Confirm "
#    And Click on element by text " Confirm "
#    And Wait for element by text "Success"
#    And Assert element by text "Success"
#
#    And Assert element by contains text "Recipient saved"
#    And Assert element by contains text "RSD was sent"
#
#
#    And Click on tab "Recipients" from main sidebar
#    And Assert that recipient has same accNumber
#    And Click on tab "Payments" from main sidebar
#    And Click on element by containing text "Upcoming payments"
#    And Click on element by containing class "icon-chevron-down" with index "1"
#    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
#    And Assert payments in past payments have loaded
#
#    And Scroll till you find element under key "IT_001" from txt file and click
#    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_name_short"
#    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_city_short"
#    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
#    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_country_short"


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
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban2" into "AccountNumber" input field
    And Assert element by contains text "First and last name"
    And Enter text "Enil Cicvi" into "First and last name" input field and remember it under key "keyName"
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
    And Assert element by contains text "First and last name"
    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text "Address"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by tag "dt" containing text "First and last name" with index "2"
    And Assert text under key "keyName" is displayed
    And Assert address is displayed from remembered keys "keyStreet" and "keyCity"
    And Assert element by contains text from excel "<rowindex>" columnName "domestic_payment_bban2" is displayed

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
    And Assert element by contains text from excel "<rowindex>" columnName "domestic_payment_bban2" is displayed
    And Assert element by xPath "//*[text()='Address']/following-sibling::div/div[1]" has text form key "keyStreet"
    And Assert element by xPath "//*[text()='Address']/following-sibling::div/div[2]" has text form key "keyCity"

    Examples:
      | rowindex |
      |        1 |


  @Domestic_Payments_Modify_Data_[WEB]
  Scenario Outline: Domestic_Payments_Modify_Data_[WEB]

#    Given Open Login page
#    And Change language to English
#    And Login to the page using user from Excel "<rowindex>" columnName "username"
#    And Click on element by text "Pay or transfer"
#
#    #And Click on element by xpath "(//nlb-contact-item)[2]"
#    And Enter text "265111031234567824" in field by xPath "//label[text()='Account number']/following-sibling::div//input"
#    And Enter text "koar tgr" in field by xPath "//label[contains(text(), 'name')]/following-sibling::div//input" and remember under key "nameKey"
#    And Enter text "kaludjerica 30" in field by xPath "//label[contains(text(), 'Street')]/following-sibling::div//input" and remember under key "streetKey"
#    And Enter text "niš" in field by xPath "//label[text()='City']/following-sibling::div//input" and remember under key "cityKey"
#    And Enter text "100" in field by xPath "//label[text()='Payment amount ']/following-sibling::div//input"
#
#    And Assert element by contains text "Cancel"
#    And Assert element by contains text "Confirm"
#    And Click on element by containing text "Confirm"
#
#    And Remember recipient data
#    And Assert element by contains text "Back"
#    And Assert element by contains text "Cancel"
#    And Assert element by contains text "Confirm"
#
#    And Click on element by xpath "//button/div[contains(text(),'Back')]"
#    And Assert recipient data is correct
#    And Click on element by containing class "icon-chevron-down" with index "1"
#    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
#    And Click on element by containing class "icon-chevron-down" with index "2"
#    And Enter text "340000003253595464" in field by xPath "//label[text()='Account number']/following-sibling::div//input"
#    And Enter text "testni user" in field by xPath "//label[contains(text(), 'name')]/following-sibling::div//input" and remember under key "nameKey"
#    And Enter text "medakovic 30" in field by xPath "//label[contains(text(), 'Street')]/following-sibling::div//input" and remember under key "streetKey"
#    And Enter text "beograd" in field by xPath "//label[text()='City']/following-sibling::div//input" and remember under key "cityKey"
#    And Enter text "110" in field by xPath "//label[text()='Payment amount ']/following-sibling::div//input"
#    And Enter text "11" in field by xPath "//label[text()='Reference number']/following-sibling::div//input"
#    And Click on element by containing class "icon-chevron-down" with index "2"
#    And Click on element by containing class "dropdown-select-item" with index "5"
#    And Click on element by class "icon-calendar-today"
#
#    And Click on element by xpath "//span[contains(@class,'onlyOneSelected')]/ancestor::div[@role='gridcell']/following-sibling::div[@role='gridcell' and not(contains(@class,'hidden'))][1]"


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
    And Assert element by contains text "Select recepient"
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    #Lose spelovano. RECEPIENT umesto RECIPIENT. Padace kad ga isprave
    And Click on normalized text "Select recepient"
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Click on first recipient
    And Assert element by class "tw-items-center" containing text "Change recipient"
    And Assert element by contains text "AccountNumber"
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban" into "AccountNumber" input field
    And Assert element by contains text "First and last name"
    And Enter text "Ime Automatizacija Web" into "First and last name" input field and remember it under key "keyName"
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
    And Assert element by contains text "First and last name"
    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text "Address"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by tag "dt" containing text "First and last name" with index "2"
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
      |        1 |


    #OBRISI OVAJ TEST KAD BUDES MOGAO
  @Domestic_Payments_In_Future2_[WEB]
  Scenario Outline: Domestic_Payments_In_Future2_[WEB]

    #TODO: Kada se resi konacnos ta je sa tarifama, dodati i proveru tarife u okviru placanja u istoj/drugoj banci
    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Click on element by text "Payments"
    And Click on element by text "Domestic payment"
    And Assert today date in Payment date in payment review
    And Assert element by class "icon-calendar-today"

    #TODO: Dodati authorized kad bude bilo..
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Click on element by text "Select from list "
    And Click on element by containing class "tw-px-3 tw-cursor-pointer" with index "2"

    #And Click on element by xpath "(//*[contains(@class, 'justify-center tw-cursor')])[2]"
    #And Click on element by containing text " koar tgr "
    And Assert "First and last name / Company name" in pay or transfer screen is from excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert "Street and street number" in pay or transfer screen is from excel "<rowindex>" columnName "user_street_for_payment_review"
    And Assert "City" in pay or transfer screen is from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert "Account number" in pay or transfer screen is from excel "<rowindex>" columnName "user_bban_for_payment_review"
    And Assert "Address" in payment review is from excel "<rowindex>" columnName "user_address_for_payment_review"
    And Enter text "73" in field by xPath "//label[text()='Payment amount ']/following-sibling::div//input"
    And Assert "Payment amount" in pay or transfer screen is from excel "<rowindex>" columnName "user_amount_for_payment_review"
    And Assert amount currency is displayed in "RSD"
    And Click on element by class "icon-calendar-today"
    And Assert checkbox "Urgent payment" is checked "true"
    And Click on date 30 days in the future in second payment screen
    And Assert date 30 days in future in payment screen
    And Assert checkbox "Urgent payment" is checked "false"
    #And Click on element by containing text "Urgent payment"
    And Scroll to element by tag "input"
    And Assert element by xPath "//input[@type='checkbox']" and index 1 is disabled
    And Enter random purpose into purpose field for internal payment in second payment screen and remember it under key "IT_001"

    #TODO: KADA RESE BUG, DODAIT PROVERU DA NIJE MOGUCE KLIKNUTI NA CHECKBOX KADA JE PLACANJE U BUDUCNOSTI
    Then Click on element by text " Confirm "
       Then Assert element by text "Purpose code" has following sibling "dd" with text "289"
    And Assert date 30 days in future in payment review

     #provera sa dve razliite funkcije za Frist and last name/ Company name i account number"
    And Assert "First and last name / Company name" in payment review is from excel "<rowindex>" columnName "username_debtor_for_payment_review"
    Then Assert element by text "First and last name / Company name" has following sibling "dd" with text from Excel "<rowindex>" columnName "username_debtor_for_payment_review" and index 0
    And Assert "Account number" in payment review is from excel "<rowindex>" columnName "current_account_2_bban"
    Then Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "current_account_2_bban" and index 0

    Then Assert element by text "First and last name / Company name" has following sibling "dd" with text from Excel "<rowindex>" columnName "user_name_for_payment_review" and index 1
    And Assert second "First and last name / Company name" in payment review is from excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert second "Account number" in payment review is from excel "<rowindex>" columnName "user_bban_for_payment_review"
    Then Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "user_bban_for_payment_review" and index 1

    Then Assert element by text "Address" has following sibling "dd" with text from Excel "<rowindex>" columnName "user_address_for_payment_review" and index 1
    And Assert element by text "Cancel"
    And Assert element by text "Back"
    And Assert element by text " Confirm "

    Then Click on element by text " Confirm "
    And Try to assert that payment is "Success" and send command to Authorize method
    #proveriti sa Adamom/Jovanom cemu sluzi korak ispod
#    And Check if authorization is needed and complete payment with account iban from Excel "<rowindex>" columnName "united_kingdom_iban" amount "10.00" and currency "EUR" with message "Success"
    And Click on tab "Payments" from main sidebar
    Then Assert element by tag "div" containing text "Payments"
    And Select account from Excel "<rowindex>" columnName "current_account_2_bban" in Payments tab
    And Click on element by containing text "Upcoming payments"
    And Scroll till you find element under key "IT_001" from txt file and click
    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_name_short"
    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_city_short"
    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_country_short"
    #TODO: Transakcjie se ne pojavljuju, da li zato sto nije urgent payment?
    #Kad se pojavi ta transakcija assertovati je...
    
    Examples:
      | rowindex |
      |        1 |


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
    And Enter text "Enil" in "First and last name" input field and remember under key "nameKey"
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
    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Assert element by contains text "Recipient"
    And Assert "First and last name" element under key "nameKey" with index "2" is displayed
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
    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed
    And Assert text under key "accountNumberKey" is displayed
    And Assert recipient address contains values from keys "streetKey" and "cityKey"

    Examples:
      | rowindex |
      |        1 |


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
    And Assert element by contains text "Select recepient"
    And Assert element by xPath "//nlb-search-box"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    #Lose spelovano. RECEPIENT umesto RECIPIENT. Padace kad ga isprave
    And Click on normalized text "Select recepient"
    And Assert element by xPath "//nlb-search-box"
    And Click on first recipient
    And Assert element by class "tw-items-center" containing text "Change recipient"
    And Assert element by contains text "AccountNumber"
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban" into "AccountNumber" input field
    And Assert element by contains text "First and last name"
    And Enter text "Ime Automatizacija Web" into "First and last name" input field and remember it under key "keyName"
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
    And Assert element by contains text "First and last name"
    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text "Address"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by tag "dt" containing text "First and last name" with index "2"
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
    And Click on normalized text "Upcoming payments"
    And Assert text under key "keyPurpose" is displayed
    And Click on tab "My NLB" from main sidebar
#    And Wait for element by text "Pay or transfer"
    And Wait for element by tag "nlb-dashboard-carousel"
    And Wait for "2" seconds
    And Assert text under key "keyPurpose" is displayed
    And Assert text under key "keyName" is displayed

    Examples:
      | rowindex |
      |        1 |


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
    And Assert element by contains text "Select recepient"
    And Assert element by xPath "//nlb-search-box"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    #Lose spelovano. RECEPIENT umesto RECIPIENT. Padace kad ga isprave
    And Click on normalized text "Select recepient"
    And Assert element by xPath "//nlb-search-box"
    And Click on first recipient
    And Assert element by class "tw-items-center" containing text "Change recipient"
    And Assert element by contains text "AccountNumber"
    And Enter text from Excel "<rowindex>" columnName "domestic_payment_bban" into "AccountNumber" input field
    And Assert element by contains text "First and last name"
    And Enter text "Ime Automatizacija Web" into "First and last name" input field and remember it under key "keyName"
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
    And Assert element by contains text "First and last name"
    And Assert text under key "fullNameKey" is displayed
    And Assert element by contains text "Address"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed

    And Assert element by class "bold heading-5 ng-star-inserted" containing text "Recipient"
    And Assert element by tag "dt" containing text "First and last name" with index "2"
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
    And Click on normalized text "Upcoming payments"
    And Assert text under key "keyPurpose" is displayed
    And Click on tab "My NLB" from main sidebar
    And Wait for element by text "Pay or transfer"
    And Wait for "2" seconds
    And Assert text under key "keyPurpose" is displayed
    And Assert text under key "keyName" is displayed

    Examples:
      | rowindex |
      |        1 |