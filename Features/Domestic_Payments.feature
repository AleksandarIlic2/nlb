Feature: Domestic_Payments


  @Payments-Domestic_Payments-Cancel_Button_[WEB]
  Scenario Outline: Payments-Domestic_Payments-Cancel_Button_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    When Wait for element by text "Pay or transfer"

    And Click on tab "Payments" from main sidebar
    And Click on element by text "Domestic payment"
    And Enter account number
    And Enter recipient name
    And Enter amount
    And Assert element by text "Cancel"

    And Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Cancelling now will terminate the payment process."
    And Assert button by text "No"
    And Assert button by text "Yes"

    And Click on element by text "No"
    #TODO kad se otkloni BUG, treba otkomentarisati Confirm
    #And Click on element by text "Confirm"

    And Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Cancelling now will terminate the payment process."
    And Assert button by text "No"
    And Assert button by text "Yes"

    And Click on element by text "Yes"


    Examples:
      | rowindex |
      |        1 |

  @Payments-Domestic-Payments-Back-Button_[WEB]
  Scenario Outline: Payments-Domestic_Payments-Back_Button_[WEB]


    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    When Wait for element by text "Pay or transfer"

    And Click on tab "Payments" from main sidebar
    And Click on element by text "Domestic payment"
    And Click on element by containing text "Select from list"
    And Click on element by xpath "//button//div[contains(text(),\"Select from list\")]"
    And Click on element by containing text "MIKA MIKIC"
    And Enter amount "100"
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Assert element by contains text "Confirm"

    And Click on element by containing text "Confirm"

    And Remember recipient data
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Assert element by contains text "Confirm"
    
    And Click on element by xpath "//button/div[contains(text(),'Back')]"
    And Assert recipient data is correct



    Examples:
      | rowindex |
      |        1 |
  @Payments-Domestic_Payments-Create_New_Recipient_[WEB]
  Scenario Outline: Payments-Domestic_Payments-Create_New_Recipient_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    #TODO: Razmotriti da li ove podatke vuci iz eksela
    When Click on element by text "Pay or transfer"
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Enter text "205900100024380847" in field by xPath "//label[text()='Account number']/following-sibling::div//input"
    And Enter text "KOAR TGR" in field by xPath "//label[contains(text(), 'name')]/following-sibling::div//input"
    And Enter text "ULICAA" in field by xPath "//label[contains(text(), 'Street')]/following-sibling::div//input"
    And Enter text "Beograd" in field by xPath "//label[text()='City']/following-sibling::div//input"
    And Enter text "129" in field by xPath "//label[text()='Payment amount ']/following-sibling::div//input"
    And Click on element by text "Save recipient "
    And Enter random purpose into purpose field for internal payment in second payment screen and remember it under key "IT_001"

    And Remember recipient number and name
    Then Click on element by text " Confirm "
    And Wait for element by text " Confirm "
    And Click on element by text " Confirm "
    And Wait for element by text "Success"
    And Assert element by text "Success"

    And Assert element by contains text "Recipient saved"
    And Assert element by contains text "RSD was sent"


    And Click on tab "Recipients" from main sidebar
    And Assert that recipient has same accNumber
    And Click on tab "Payments" from main sidebar
    And Click on element by containing text "Upcoming payments"
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert payments in past payments have loaded

    And Scroll till you find element under key "IT_001" from txt file and click
    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_name_short"
    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_city_short"
    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_street_for_payment_review"
    And Assert that transaction "Recipient" in opened past payment contains text from Excel "<rowindex>" columnName "user_country_short"

    Examples:
      | rowindex |
      |        1 |


  @Domestic_Payments_Modify_Data_[WEB]
  Scenario Outline: Domestic_Payments_Modify_Data_[WEB]
    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    When Click on element by text "Pay or transfer"

    #And Click on element by xpath "(//nlb-contact-item)[2]"
    And Enter text "265111031234567824" in field by xPath "//label[text()='Account number']/following-sibling::div//input"
    And Enter text "koar tgr" in field by xPath "//label[contains(text(), 'name')]/following-sibling::div//input" and remember under key "nameKey"
    And Enter text "kaludjerica 30" in field by xPath "//label[contains(text(), 'Street')]/following-sibling::div//input" and remember under key "streetKey"
    And Enter text "niš" in field by xPath "//label[text()='City']/following-sibling::div//input" and remember under key "cityKey"
    And Enter text "100" in field by xPath "//label[text()='Payment amount ']/following-sibling::div//input"

    And Assert element by contains text "Cancel"
    And Assert element by contains text "Confirm"
    And Click on element by containing text "Confirm"

    And Remember recipient data
    And Assert element by contains text "Back"
    And Assert element by contains text "Cancel"
    And Assert element by contains text "Confirm"

    And Click on element by xpath "//button/div[contains(text(),'Back')]"
    And Assert recipient data is correct
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Click on element by containing class "icon-chevron-down" with index "2"
    And Enter text "340000003253595464" in field by xPath "//label[text()='Account number']/following-sibling::div//input"
    And Enter text "testni user" in field by xPath "//label[contains(text(), 'name')]/following-sibling::div//input" and remember under key "nameKey"
    And Enter text "medakovic 30" in field by xPath "//label[contains(text(), 'Street')]/following-sibling::div//input" and remember under key "streetKey"
    And Enter text "beograd" in field by xPath "//label[text()='City']/following-sibling::div//input" and remember under key "cityKey"
    And Enter text "110" in field by xPath "//label[text()='Payment amount ']/following-sibling::div//input"
    And Enter text "11" in field by xPath "//label[text()='Reference number']/following-sibling::div//input"
    And Click on element by containing class "icon-chevron-down" with index "2"
    And Click on element by containing class "dropdown-select-item" with index "5"
    And Click on element by class "icon-calendar-today"

    And Click on element by xpath "//span[contains(@class,'onlyOneSelected')]/ancestor::div[@role='gridcell']/following-sibling::div[@role='gridcell' and not(contains(@class,'hidden'))][1]"


    Examples:
      | rowindex |
      |        2 |


  @Domestic_Payments_In_Future_[WEB]
  Scenario Outline: Domestic_Payments_In_Future_[WEB]
    #TODO: Kada se resi konacnos ta je sa tarifama, dodati i proveru tarife u okviru placanja u istoj/drugoj banci
    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Click on element by text "Payments"
    And Click on element by text "Domestic payment"
    And Assert today date in Payment date in payment review
    And Assert element by class "icon-calendar-today"
    And Assert checkbox Urgent payment is "checked"
    #TODO: Dodati authorized kad bude bilo..
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Click on element by text "Select from list "
    And Click on element by containing text "MIKA MIKIC"
    And Assert "First and last name / Company name" in pay or transfer screen is from excel "<rowindex>" columnName "user_name_for_payment_review"
    And Assert "Street and street number" in pay or transfer screen is from excel "<rowindex>" columnName "user_street_for_payment_review"
    And Assert "City" in pay or transfer screen is from excel "<rowindex>" columnName "user_city_for_payment_review"
    And Assert "Account number" in pay or transfer screen is from excel "<rowindex>" columnName "user_bban_for_payment_review"
    #And Assert "Address" in payment review is from excel "<rowindex>" columnName "user_address_for_payment_review"
    And Enter text "73" in field by xPath "//label[text()='Payment amount ']/following-sibling::div//input"
    And Assert "Payment amount" in pay or transfer screen is from excel "<rowindex>" columnName "user_amount_for_payment_review"
    And Assert amount currency is displayed in "RSD"
    And Click on element by class "icon-calendar-today"
    And Click on date 30 days in the future in second payment screen
    And Assert date 30 days in future in payment screen
    And Assert checkbox Urgent payment is "notChecked"
    And Assert element by tag "input" and type "checkbox" is disabled

    #TODO: KADA RESE BUG, DODAIT PROVERU DA NIJE MOGUCE KLIKNUTI NA CHECKBOX KADA JE PLACANJE U BUDUCNOSTI
    Then Click on element by text " Confirm "
    Then Assert element by text "Purpose" has following sibling "dd" with text "TRANSACTIONS BY ORDER OF CITIZENS"
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
    And Check if authorization is needed and complete payment with account iban from Excel "<rowindex>" columnName "united_kingdom_iban" amount "10.00" and currency "EUR" with message "Success"
    And Click on tab "Payments" from main sidebar
    Then Assert element by tag "div" containing text "Payments"
    And Select account from Excel "<rowindex>" columnName "current_account_2_bban" in Payments tab
    And Click on element by containing text "Upcoming payments"
    #TODO: Transakcjie se ne pojavljuju, da li zato sto nije urgent payment?
    #Kad se pojavi ta transakcija assertovati je...
    
    Examples:
      | rowindex |
      |        1 |