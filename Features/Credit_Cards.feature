Feature: Credit_Cards

  @Credit_Cards-Header_Display_[WEB]
  Scenario Outline: Credit_Cards-Header_Display_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Assert tabs in Product details are displayed correctly for Credit Cards
    And Assert element by contains src "CreditCard-Icon" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "cardName" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "credit_card_2_number" is displayed
    And Assert amount and currency are displayed by xPaths "(//div/nlb-amount/div/span)[1]" and "(//div/nlb-amount/div/span)[2]"

    Then Click on element by containing text "Details"
    And Wait for element by xPath "(//*[text() = 'Financial details'])[2]"
    And Assert element by contains src "CreditCard-Icon" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "credit_card_2_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "cardName" is displayed
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

    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    And Assert Credit card BBAN in Product details is from Excel "<rowindex>" columnName "credit_card_2_number"
    And Assert Transactions tab is selected by default
    And Assert element by contains text "Transactions"
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert element by contains text "Filters"
    And Click on element by containing text "Filters"
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
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Clear filters"
    And Assert element by contains text "Download transaction list"

    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"
    #Otvaranje kalendara
    And Click on button with tag "i" containing class "icon-calendar-today"
    And Assert window behind Date filter popup is blurred
    And Assert Select date title in Date filter

    And Select date in From label to be "06.05.2025"
    And Select date in To label to be "01.07.2025"
    And Click on element by containing text "Confirm"
    And Wait for first transaction in Product details
    And Scroll element by contains text "end of the list" into view
    And Assert transaction dates are between "06.05.2025" and "01.07.2025"
    And Scroll element by contains text "Clear filters" into view
    And Click on element by containing text "Clear filters"

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

    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    And Assert Credit card BBAN in Product details is from Excel "<rowindex>" columnName "credit_card_2_number"
    And Click on element by containing text "Filters"
    And Scroll element by contains text "Details" into view

    Then Click on button with tag "i" containing class "icon-calendar-today"
    And Assert window behind Date filter popup is blurred
    And Assert Select date title in Date filter

    And Select date in From label to be "15.04.2026"
    And Click on calendar icon with index "2"
    And Check if date "12.04.2026" is not enabled
    And Check if date "02.04.2026" is not enabled

    Examples:
      | rowindex |
      |        1 |


  @Credit_Cards-Transactions_List_No_Transactions_[WEB]
  Scenario Outline: Credit_Cards-Transactions_List_No_Transactions_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    And Assert Credit card BBAN in Product details is from Excel "<rowindex>" columnName "credit_card_2_number"
    And Assert Transactions tab is selected by default

#    Then Assert element by contains text "no transactions to be displayed"
    Then Assert element by contains text "EmptyState"

    Examples:
      | rowindex |
      |        7 |

  @Credit_Cards-Transactions-Download_Option_[WEB]
  Scenario Outline: Credit_Cards-Transactions-Download_Option_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    And Wait for first transaction in Product details
    And Scroll to element by tag "nlb-selected-product-transactions-filters"

    And Click on normalized text "Download transaction list"
#    And Assert Download transactions options are "EXCEL" and "CSV"
    And Assert Download transactions options are "Products_Common_Transactions_Download_Excel_Action" and "Products_Common_Transactions_Download_CSV_Action"
    And Scroll element by contains text "Products_Common_Transactions_Download_CSV_Action" into bottom view
#    And Click on element by containing text "EXCEL"
    And Click on element by containing text "Products_Common_Transactions_Download_Excel_Action"
    And Assert document with name "Transactions.xlsx" is downloaded

    Then Click on normalized text "Download transaction list"
#    And Assert Download transactions options are "EXCEL" and "CSV"
    And Assert Download transactions options are "Products_Common_Transactions_Download_Excel_Action" and "Products_Common_Transactions_Download_CSV_Action"
#    And Click on element by containing text "CSV"
    And Click on element by containing text "Products_Common_Transactions_Download_CSV_Action"
    And Assert document with name "Transactions.csv" is downloaded

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

    When Wait for element by text "Edit list"
    And Assert element by class "button-bold" and contains text "Edit list"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    And Assert element by text from excel "<rowindex>" columnName "credit_card_2_number" is displayed

    And Assert Transactions tab is selected by default
    And Click on element by containing text "Filters"

     #filter by type - incoming
    And Scroll screen down
    And Select radio button by text "Incoming transactions"
    And Click on element by text " Confirm "
    And Wait for first transaction in Product details
    And Assert there are only Incoming transactions in transactions list
    And Assert there are only "Incoming transactions" transactions in transactions list
    And Assert transaction dates are ordered correctly

    And Click on element by containing text "Clear filters"
    And Click on element by containing text "Filters"
#    And Assert date picker "card"
    And Scroll screen down
    And Select radio button by text "Outgoing transactions"
    And Click on element by containing text "Confirm"
    And Wait for first transaction in Product details
    And Assert there are only Outgoing transactions in transactions list
#    And Assert there are only "outgoing" transactions in transactions list
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

    When Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    And Assert element by text from excel "<rowindex>" columnName "credit_card_2_number" is displayed
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Click on element by aria label "Open or close filters"
    And Assert Advanced filters Amount range title
    And Assert Advanced filters Amount range fields for Domestic accounts are correct displayed
    And Assert All is selected in Transaction type by default

    Then Enter "100" to Amount filter "From"
    And Enter "800" to Amount filter "To"
    And Assert Amount filter field "From" has value "100,00"
    And Assert Amount filter field "To" has value "800,00"
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert transaction amounts after filter are between 100 and 800
    And Click on NLB button "Clear filters"
    And Wait for first transaction in Product details
    And Assert that transaction amounts after filter disabling are not only between 100 and 800

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

    When Assert element by class "button-bold" and contains text "Edit list"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_name"
    And Wait for element by tag "nlb-product-detail-header"
    And Click on element by containing text "Filters"
    And Assert Amount input fields have "RSD" currency

    Then Enter "1000" to Amount filter "From"
    And Enter "800" to Amount filter "To"
#    And Assert element by contains text "From amount must be smaller than To amount"
    And Assert element by contains text "ValidationError"

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

    When Assert element by class "button-bold" and contains text "Edit list"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_name"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"

    And Assert Transactions tab is selected by default
    And Wait for first transaction in Product details
    And Click on down arrow on first transaction do display details
    And Assert element by text "Amount" has following sibling "dd" with regex "^\d{1,3}(\.\d{3})*,\d{2}\s*RSD$"
    And Assert element by text "Amount in local currency" has following sibling "dd" with regex "^\d{1,3}(\.\d{3})*,\d{2}\s*RSD$"
#    And Assert element by text "Settlement date" has following sibling "dd" with text "01.07.2025"
    And Assert element by text "Settlement date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Value date" has following sibling "dd" with text "01.07.2025"
    And Assert element by text "Products_Common_TransactionDetails_ValueDate" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Authorization date" has following sibling "dd" with text "01.07.2025"
    And Assert element by text "Authorization date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
#    And Assert element by text "Transaction ID" has following sibling "dd" that contains text "0999E688B8E110"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^0999E[A-Za-z0-9]{9}$"
    And Assert element by tag "span" containing text "Send message"
    # Korak ispod se koristi kod Slovenaca, treba li da postoji u testu?
    And Assert element by tag "div" containing text "Confirmation" is not displayed
    And Click on down arrow on first transaction do display details
    And Assert element by contains text "Value date" is not displayed
    And Assert element by class "tw-text-incomingColor" and index "1"

    Examples:
      | rowindex |
      |        1 |

  @Credit_Cards-Transactions-Filter-Filter_By_Status_[WEB]
  Scenario Outline: Credit_Cards-Transactions-Filter-Filter_By_Status_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Assert element by class "button-bold" and contains text "Edit list"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    And Assert Credit card BBAN in Product details is from Excel "<rowindex>" columnName "credit_card_2_number"

    And Assert Transactions tab is selected by default
    And Assert element by contains text "Transactions"
    And Assert element by contains text "Filters"
    And Click on element by containing text "Filters"

    #executed
    Then Click on element by containing text "Executed"
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert there are both incoming and outgoing transactions

    #panding
    And Click on element by containing text "Pending"
    And Click on NLB button "Confirm"
#    And Wait for element by text "There are no transactions to be displayed."
#    And Assert element by text "There are no transactions to be displayed."
    And Wait for element by contains text "EmptyState"
    And Assert element by contains text "EmptyState"

    #all
#    And Click on element by text "All" index "2"
    And Click on element by text "Products_CurrentAccount_ChequeDetails_EditChequeData_Status_All"
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert there are both incoming and outgoing transactions

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
    When Assert element by class "button-bold" and contains text "Edit list"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_2_number"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "credit_card_2_name"
    And Assert element by text from excel "<rowindex>" columnName "credit_card_2_number" is displayed

    And Assert Transactions tab is selected by default
    And Click on element by containing text "Filters"

    And Click on calendar icon with index "1"
    And Select date in From label to be "15.04.2026"
    And Click on calendar icon with index "2"
    And Check if date "12.04.2026" is not enabled
    And Check if date "05.04.2026" is not enabled
    And Assert element by aria label "Previous month" is not enabled
    And Click on element by containing text "Cancel"

    Then Enter "10000" to Amount filter "From"
    And Enter "5000" to Amount filter "To"
#    And Assert element by contains text "From amount must be smaller than To amount"
    And Assert element by contains text "ValidationError"

    Examples:
      | rowindex |
      |        1 |