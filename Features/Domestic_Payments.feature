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
  @Payments-Domestic_Payments-Create_New_Recipient_[WEB]
  Scenario Outline: Payments-Domestic_Payments-Create_New_Recipient_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on element by text "Pay or transfer"
    And Enter text "340000003253595464" in field by xPath "//label[text()='Account number']/following-sibling::div//input"
    And Enter text "Ana Janicijevic" in field by xPath "//label[contains(text(), 'name')]/following-sibling::div//input"
    And Enter text "Bulevar 11" in field by xPath "//label[contains(text(), 'Street')]/following-sibling::div//input"
    And Enter text "Beograd" in field by xPath "//label[text()='City']/following-sibling::div//input"
    And Enter text "100" in field by xPath "//label[text()='Payment amount ']/following-sibling::div//input"
    And Click on element by text "Save recipient "

    And Remember recipient number and name
    Then Click on element by text " Confirm "
    And Click on element by text " Confirm "
    And Wait for element by text " Confirm "
    And Click on element by text " Confirm "
    And Click on element by text " Confirm "
    And Click on element by text " Confirm "
    And Wait for element by text "Success"
    And Assert element by text "Success"
    And Click on element by containing text "OK"

    And Wait for element by text "Success"
    And Assert element by text "Success"
    And Assert element by contains text "Recipient saved"
    And Assert element by contains text "RSD was sent"


    And Click on tab "Recipients" from main sidebar
    And Assert that recipient has same accNumber
    #TODO -dodati ovo ispod kad bude radio payment do kraja
    #And Click on tab "Payments" from main sidebar
    #And Assert that last payment is correct

    Examples:
      | rowindex |
      |        1 |