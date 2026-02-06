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
    And Assert element by text " Download transaction list "

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
    And Assert element by text " Download transaction list "
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
    And Assert element by text " Download transaction list "
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
    And Assert element by text " Download transaction list "

    And Assert element by contains text "no transactions to be displayed"

    Examples:
      | rowindex |
      |        1 |

  @Credit_Cards-Transactions-Download_Option_[WEB]
  Scenario Outline: Credit_Cards-Transactions-Download_Option_[WEB]


    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    #User is logged into aplication and clicks on the My Products page frome the menu
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold" and contains text "Edit list"

    #User clicks on a current account on the My Products page
    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_name"
    And Wait for element by tag "nlb-product-detail-header"

    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    #And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "credit_card_1_name"

    #Below the header there are tabs: Transactions, Card settings, Statements, Details Exchange.
    #User is by default on Transactions tab.
    And Assert order of tabs in tablist "card"

    #Below the tabs, icons for Date picker, Filter, Select category and Search filter are displayed on the left side.
      # On the right side there is a Download option
    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker "domestic"

    #User Filters the list with valid parameters

    #filter by amount
    And Enter "10000,00" to Amount filter "From"
    And Enter "20000,00" to Amount filter "To"
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert transaction amounts after filter are between 10000 and 20000

    #filter by type - outgoing
    And Select transaction type "Outgoing transactions" in Advanced filters
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert there are only "Outgoing transactions" transactions in transactions list
    Then Remember transactions "Outgoing transactions"
      # and clicks on the Download in Excel option
    And Click on normalized text "Download transaction list"
    And Assert Download transactions options are "EXCEL" and "CSV"
    And Scroll element by contains text "CSV" into bottom view
    And Click on element by containing text "EXCEL"
    And Assert document with name "Transactions.xlsx" is downloaded
    Then Assert xlsx values are correct
       # and clicks on the Download in CSV option
    And Click on normalized text "Download transaction list"
    And Assert Download transactions options are "EXCEL" and "CSV"
    And Click on element by containing text "CSV"
    And Assert document with name "Transactions.csv" is downloaded
    Then Assert csv values are correct


    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards-Transactions_Filter_By_Type_[WEB]
  Scenario Outline: Credit_Cards-Transactions_Filter_By_Type_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    #User is logged into aplication and clicks on the My Products page frome the menu
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold" and contains text "Edit list"
    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_name"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    #And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "credit_card_1_name"

    And Assert Transactions tab is selected by default
    And Assert element by contains text "Transactions"
    #TODO: Assertovanje Card Settings-a ili elementa koji treba da bude umesto njega
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert element by text " Download transaction list "
    And Assert element by text " Filters"
    And Click on element by text " Filters"

     #filter by type - incoming
    And Scroll screen down
    And Select radio button by text "Incoming transactions"
    And Click on element by text " Confirm "
    And Wait for "10" seconds
    And Assert there are only "Incoming transactions" transactions in transactions list
    And Assert transaction dates are ordered correctly

    And Click on element by text " Clear filters "
    And Click on element by text " Filters"
    And Assert date picker "card"
    And Scroll screen down
    And Select radio button by text "Outgoing transactions"
    And Click on element by text " Confirm "
    And Wait for "10" seconds
    And Assert there are only "Outgoing transactions" transactions in transactions list
    And Assert transaction dates are ordered correctly


    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards-Transactions_Filter_By_Amount_[WEB]
  Scenario Outline: Credit_Cards-Transactions_Filter_By_Amount_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    #User is logged into aplication and clicks on the My Products page frome the menu
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold" and contains text "Edit list"
    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_name"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"

    And Assert Transactions tab is selected by default
    And Assert element by contains text "Transactions"
    #TODO: Assertovanje Card Settings-a ili elementa koji treba da bude umesto njega
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert element by text " Download transaction list "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Enter "100" to Amount filter "From"
    And Enter "800" to Amount filter "To"
    And Click on element by text " Confirm "
    And Wait for "20" seconds
    And Wait for first transaction in Product details
    #And Scroll element by contains text "end of the list" into view
    And Assert transaction amounts are between "100" and "800"
    And Click on element by text " Clear filters "


    Examples:
      | rowindex |
      |        1 |

  @Credit_Cards-Transactions_Filter_By_Amount_invalid_[WEB]
  Scenario Outline: Credit_Cards-Transactions_Filter_By_Amount_invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    #User is logged into aplication and clicks on the My Products page frome the menu
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold" and contains text "Edit list"
    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_name"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"

    And Assert Transactions tab is selected by default
    And Assert element by contains text "Transactions"
    #TODO:
      # Assertovanje Card Settings-a ili elementa koji treba da bude umesto njega
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert element by text " Download transaction list "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Enter "1000" to Amount filter "From"
    And Enter "800" to Amount filter "To"
    And Assert element by contains text "From amount must be smaller than To amount"


    Examples:
      | rowindex |
      |        1 |



  @Credit_Cards-Transactions_Details[WEB]
  Scenario Outline: Credit_Cards-Transactions_Details[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    #User is logged into aplication and clicks on the My Products page frome the menu
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold" and contains text "Edit list"
    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_name"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"

    And Assert Transactions tab is selected by default
    And Assert element by contains text "Transactions"
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert element by text " Download transaction list "
    And Assert element by text " Filters"
    And Click on down arrow on first transaction do display details
    Then Assert element by text "Amount" has following sibling "dd" with text "24.000,00 RSD"
    And Assert element by text "Settlement date" has following sibling "dd" with text "01.07.2025"
    And Assert element by text "Value date" has following sibling "dd" with text "01.07.2025"
    And Assert element by text "Authorization date" has following sibling "dd" with text "01.07.2025"
    And Assert element by text "Transaction ID" has following sibling "dd" that contains text "0999E688B8E110"
    And Assert element by tag "span" containing text " Send message "
    # Korak ispod se koristi kod Slovenaca, treba li da postoji u testu?
    #And Assert element by tag "div" containing text "Confirmation" is not displayed
    And Click on down arrow on first transaction do display details
    And Assert element by contains text "Value date" is not displayed
    And Assert element by class "tw-text-incomingColor" and index "1"

    Examples:
      | rowindex |
      |        1 |

  @Credit_Cards-Transactions-Filter-Filter_By_Status_[WEB]
  Scenario Outline: Credit_Cards-Transactions-Filter-Filter_By_Status_[WEB]
  #C2353

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    #User is logged into aplication and clicks on the My Products page frome the menu
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold" and contains text "Edit list"
    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_name"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"

    And Assert Transactions tab is selected by default
    And Assert element by contains text "Transactions"
    And Assert element by text " Filters"

    And Click on element by containing text "Filters"
    And Assert date picker "card"

    #status option - Executed
    And Click on element by containing text "Executed"
    #TODO  provjera, kada dodaju pending transakcije
    #status option - Pending

    Examples:
      | rowindex |
      |        1 |



  @Credit_Cards-Transactions-Filter_Multiple_Filter_Invalid_[WEB]
  Scenario Outline: Credit_Cards-Transactions-Filter_Multiple_Filter_Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    #User is logged into aplication and clicks on the My Products page frome the menu
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold" and contains text "Edit list"
    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_name"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"

    And Assert order of tabs in tablist "card"
    And Assert Transactions tab is selected by default
    And Click on element by containing text "Filters"
    And Assert date picker "card"


    And Enter "10000" to Amount filter "From"
    And Enter "5000" to Amount filter "To"
    And Assert element by contains text "From amount must be smaller than To amount"


    #TODO -BUG prijavljen

    #MMDDYY
    And Enter date "11.11.25" to field "from"
    And Enter date "23.11.2025" to field "to"
    #And Assert "From" Field has error "Field must be a date."
    And Assert element by contains text "11.11.25" is not displayed
    And Click on element by text " Confirm "
   # And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #letters - START
    And Enter date "petijanuardvehiljadedvadesetpete" to field "from"
    And Enter date "23.11.2025" to field "to"
    And Assert element by contains text "petijanuardvehiljadedvadesetpete" is not displayed
    #And Assert "From" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #start date later than end date TODO
    #special characters
    And Enter date "11.11.25@" to field "from"
    And Enter date "23.11.2025" to field "to"
    #And Assert "From" Field has error "Field must be a date."
    And Assert element by contains text "11.11.25@" is not displayed
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #end date earlier than start date

    #letters - END
    And Enter date "11.11.2025" to field "from"
    And Enter date "petijanuardvehiljadedvadesetpete" to field "to"
    #And Assert "To" Field has error "Field must be a date."
    And Assert element by contains text "petijanuardvehiljadedvadesetpete" is not displayed
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
    #special characters - END
    And Enter date "10.11.2025" to field "from"
    And Enter date "11.11.25@" to field "to"
    And Assert element by contains text "11.11.25@" is not displayed
    #And Assert "To" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
     #DD/MM/YY - END
    And Enter date "10.11.2025" to field "from"
    And Enter date "11.11.25" to field "to"
    #And Assert "To" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Assert element by contains text "11.11.25" is not displayed
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
    #YY/DD/MM - END
    And Enter date "10.11.2025" to field "from"
    And Enter date "25.25.11" to field "to"
    And Assert element by contains text "25.25.11" is not displayed
    #And Assert "To" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
    #MMDDYY - END
    And Enter date "10.11.2025" to field "from"
    And Enter date "11.11.25" to field "to"
    #And Assert "To" Field has error "Field must be a date."
    And Assert element by contains text "11.11.25" is not displayed
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
    #letters - MINAMOUNT
    And Enter "textAmount" to Amount filter "From"
    And Assert "From" amount field value
    And Click on element by text " Confirm "
    #And Assert element by text "There are no transactions to be displayed."
    #specialCharacters - MINAMOUNT

    And Enter "@@@" to Amount filter "From"
    And Assert "From" amount field value
    And Click on element by text " Confirm "
   # And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #Min amount higher than Max amount
    And Enter "200,00" to Amount filter "From"
    And Enter "100,00" to Amount filter "To"
    And Assert element by text "From amount must be smaller than To amount."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
    #letters - MAXAMOUNT
    And Enter "asdasdasd" to Amount filter "To"
    And Assert "To" amount field value
    And Click on element by text " Confirm "
    #And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #specialcharacters - MAXAMOUT
    And Enter "@@@" to Amount filter "To"
    And Assert "To" amount field value
    And Click on element by text " Confirm "
   # And Assert element by text "There are no transactions to be displayed."


    Examples:
      | rowindex |
      |        1 |