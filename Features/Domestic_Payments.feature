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
    And Click on element by containing text "KOAR TGR"
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
