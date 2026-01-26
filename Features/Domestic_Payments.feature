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
    And Assert element by text "Cancelling now will terminate this payment. Do you want to proceed?"
    And Assert button by text "No"
    And Assert button by text "Yes"

    And Click on element by text "No"
    #TODO kad se otkloni BUG, treba otkomentarisati Confirm
    #And Click on element by text "Confirm"

    And Click on element by text "Cancel"
    And Assert element by text "Are you sure?"
    And Assert element by text "Cancelling now will terminate this payment. Do you want to proceed?"
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
