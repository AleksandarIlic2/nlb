Feature: Credit_Cards

  @Credit_Cards-Header_Display_[WEB]
  Scenario Outline: Credit_Cards-Header_Display_[WEB]
    #C71150

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    Then Click on element by containing text "8476"
    And Assert element by contains src "CreditCard-Icon" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "cardName" is displayed
    And Assert PAN card number by containing text "8476"
    And Assert amount and currency are displayed by xPaths "(//div/nlb-amount/div/span)[1]" and "(//div/nlb-amount/div/span)[2]"

    When Click on element by containing text "Details"
    And Assert element by contains src "CreditCard-Icon" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "cardName" is displayed
    And Assert PAN card number by containing text "8476"
    And Assert amount and currency are displayed by xPaths "(//div/nlb-amount/div/span)[1]" and "(//div/nlb-amount/div/span)[2]"
    And Assert element by xPath "(//*[text() = 'Financial details'])[2]" is displayed
    And Assert element by xPath "(//*[text() = 'Account details'])[2]" is displayed

    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards-Transactions_Filter_By_Date-Date_Picker_[WEB]
  Scenario Outline: Credit_Cards-Transactions_Filter_By_Date-Date_Picker_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_bban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    And Assert Credit card BBAN in Product details is from Excel "<rowindex>" columnName "credit_card_2_bban"
    And Assert Transactions tab is selected by default
    And Assert element by contains text "Transactions"
    #TO DO: Assertovanje Card Settings-a ili elementa koji treba da bude umesto njega
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Scroll element by contains text "Details" into view

    #Assertovanje Date Range (labela datuma od-do)
    Then Assert element by xPath "//label[text()='From']/following-sibling::div"
    And Assert element by xPath "//label[text()='To']/following-sibling::div"
    #Assertovanje Tipa transakcije
    And Assert element by text "All"
    And Assert element by text "Incoming transactions"
    And Assert element by text "Outgoing transactions"
    #Assertovanje Amount filtera (labela iznosa od-do)
    And Assert element by xPath "//label[text()='From ']/following-sibling::div"
    And Assert element by xPath "//label[text()='To ']/following-sibling::div"
    And Assert element by text " Confirm "
    And Assert element by text " Clear filters "
    #TO DO: Odkomentarisati korak ispod kada se resi bug za DOWNLOAD dugme. Treba da bude u aplikaciji, a nema ga
#    And Assert element by text " Download transaction list "

    And Assert element by text "Last 7 days "
    And Assert element by text "Current month"
    And Assert element by text " Previous month"
    #Otvaranje kalendara
    And Click on button with tag "i" containing class "icon-calendar-today"
    And Assert window behind Date filter popup is blurred
    And Assert Select date title in Date filter

    And Select date in From label to be "06.05.2025"
    And Select date in To label to be "01.07.2025"
    And Click on element by text " Confirm "
    And Scroll element by contains text "end of the list" into view
    And Assert transaction dates are between "06.05.2025" and "01.07.2025"
    And Scroll element by contains text " Clear filters " into view
    And Click on element by text " Clear filters "

#    And Assert three showed months are correctly displayed

    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards-Transactions_Filter_By_Date-Date_Picker-invalid_[WEB]
  Scenario Outline: Credit_Cards-Transactions_Filter_By_Date-Date_Picker-invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_bban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    And Assert Credit card BBAN in Product details is from Excel "<rowindex>" columnName "credit_card_2_bban"
    And Assert Transactions tab is selected by default
    And Assert element by contains text "Transactions"
    #TO DO: Assertovanje Card Settings-a ili elementa koji treba da bude umesto njega
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    #TO DO: Odkomentarisati korak ispod kada se resi bug za DOWNLOAD dugme. Treba da bude u aplikaciji, a nema ga
#    And Assert element by text " Download transaction list "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Scroll element by contains text "Details" into view

    #Assertovanje Date Range (labela datuma od-do)
    Then Assert element by xPath "//label[text()='From']/following-sibling::div"
    And Assert element by xPath "//label[text()='To']/following-sibling::div"
    #Assertovanje Tipa transakcije
    And Assert element by text "All"
    And Assert element by text "Incoming transactions"
    And Assert element by text "Outgoing transactions"
    #Assertovanje Amount filtera (labela iznosa od-do)
    And Assert element by xPath "//label[text()='From ']/following-sibling::div"
    And Assert element by xPath "//label[text()='To ']/following-sibling::div"
    And Assert element by text " Confirm "
    And Assert element by text " Clear filters "

    And Assert element by text "Last 7 days "
    And Assert element by text "Current month"
    And Assert element by text " Previous month"
    #Otvaranje kalendara
    And Click on button with tag "i" containing class "icon-calendar-today"
    And Assert window behind Date filter popup is blurred
    And Assert Select date title in Date filter

    And Select date in From label to be "15.12.2025"
    And Select date in To label to be "01.12.2025"
    And Click on element by text " Confirm "
    And Assert element by contains text "no transactions to be displayed"

    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards-Transactions_List_No_Transactions_[WEB]
  Scenario Outline: Credit_Cards-Transactions_List_No_Transactions_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_3_bban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_3_name"
    And Assert Credit card BBAN in Product details is from Excel "<rowindex>" columnName "credit_card_3_bban"
    And Assert Transactions tab is selected by default
    And Assert element by contains text "Transactions"
    #TO DO: Assertovanje Card Settings-a ili elementa koji treba da bude umesto njega
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    #TO DO: Odkomentarisati korak ispod kada se resi bug za DOWNLOAD dugme. Treba da bude u aplikaciji, a nema ga
#    And Assert element by text " Download transaction list "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Scroll element by contains text "Details" into view

    #Assertovanje Date Range (labela datuma od-do)
    Then Assert element by xPath "//label[text()='From']/following-sibling::div"
    And Assert element by xPath "//label[text()='To']/following-sibling::div"
    #Assertovanje Tipa transakcije
    And Assert element by text "All"
    And Assert element by text "Incoming transactions"
    And Assert element by text "Outgoing transactions"
    #Assertovanje Amount filtera (labela iznosa od-do)
    And Assert element by xPath "//label[text()='From ']/following-sibling::div"
    And Assert element by xPath "//label[text()='To ']/following-sibling::div"
    And Assert element by text " Confirm "
    And Assert element by text " Clear filters "
    #TO DO: Odkomentarisati korak ispod kada se resi bug za DOWNLOAD dugme. Treba da bude u aplikaciji, a nema ga
#    And Assert element by text " Download transaction list "

    And Assert element by contains text "no transactions to be displayed"

    Examples:
      | rowindex |
      |        1 |