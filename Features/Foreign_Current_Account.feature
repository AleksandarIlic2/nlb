Feature: Foreign_Current_Account

  @Foreign_Current_Account_Product_Details_Account_Details_[WEB]
  Scenario Outline: Foreign_Current_Account_Product_Details_Account_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    When Wait for element by text "Pay or transfer"

    #And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_name"
    When Assert that products in my products have loaded
    And Assert element by class "button-bold" and contains text "Edit list"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Click on element by text "Details"
    And Wait for product details to load

    #And Scroll screen down
    Then Assert element by text "Account details" index "2" is displayed
    And Assert element by tag "nlb-icon" and attribute "name" with value "icon-copy"
    And Assert that element "Account type" has value "Current account"
    And Assert that element "BIC" has value "KOBBRSBG"
    And Assert that element "Account owner" is equal to value from Excel "<rowindex>" columnName "username"
    And Assert that element "IBAN" is equal to value from Excel "<rowindex>" columnName "current_account_1_iban"

    Examples:
      | rowindex |
      |        1 |


  @Foreign_Current_Accounts-Transactions-Filter_By_Type_[WEB]
  Scenario Outline: Foreign_Current_Accounts-Transactions-Filter_By_Type_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert there are both incoming and outgoing transactions
    And Click on element by aria label "Open or close filters"

    #Incoming
    And Assert Advanced filters Transaction type title
    And Assert Advanced filters Transaction types are correct
    And Assert Advanced filters Amount range title
    And Assert Advanced filters Amount range fields for Foreign accounts are correct displayed
    And Assert NLB button "Clear filters"
    And Assert NLB button "Confirm"
    And Assert All is selected in Transaction type by default
    And Select transaction type "Incoming transactions" in Advanced filters
    And Assert Incoming transactions is selected in Transaction type
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details

    Then Assert there are only Incoming transactions in transactions list
    And Click on element by containing text "Clear filters"
    And Wait for first transaction in Product details
    And Assert there are both incoming and outgoing transactions

    #Outgoing
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Click on element by aria label "Open or close filters"
    And Assert All is selected in Transaction type by default
    And Select transaction type "Outgoing transactions" in Advanced filters
    And Assert Outgoing transactions is selected in Transaction type
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details

    And Assert there are only Outgoing transactions in transactions list
    And Click on element by containing text "Clear filters"
    And Wait for first transaction in Product details
    And Assert there are both incoming and outgoing transactions

    Examples:
      | rowindex |
      |        2 |


  @Current_Domestic_Accounts-Transactions-Download_option_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Download_option_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Assert element by class "button-bold"

    #User clicks on a current account on the My Products page
    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_iban"
    And Assert order of tabs in tablist "foreign"
    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker "domestic"

    #filter by amount
    And Enter "100,00" to Amount filter "From"
    And Enter "500,00" to Amount filter "To"
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert transaction amounts after filter are between 100 and 500

    #filter by type
    And Select transaction type "Outgoing transactions" in Advanced filters
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert there are only Outgoing transactions in transactions list

    Then Remember transactions "Outgoing transactions"
      # and clicks on the Download in Excel option
    And Click on normalized text "Download transaction list"
#    And Assert Download transactions options are "EXCEL" and "CSV"
    And Assert Download transactions options are "Products_Common_Transactions_Download_Excel_Action" and "Products_Common_Transactions_Download_CSV_Action"
#    And Scroll element by contains text "CSV" into bottom view
    And Scroll element by contains text "Products_Common_Transactions_Download_CSV_Action" into bottom view
#    And Click on element by containing text "EXCEL"
    And Click on element by containing text "Products_Common_Transactions_Download_Excel_Action"
    And Assert document with name "Transactions.xlsx" is downloaded
    And Assert xlsx values are correct
       # and clicks on the Download in CSV option
    And Click on normalized text "Download transaction list"
#    And Assert Download transactions options are "EXCEL" and "CSV"
    And Assert Download transactions options are "Products_Common_Transactions_Download_Excel_Action" and "Products_Common_Transactions_Download_CSV_Action"
#    And Click on element by containing text "CSV"
    And Click on element by containing text "Products_Common_Transactions_Download_CSV_Action"
    And Assert document with name "Transactions.csv" is downloaded
    And Assert csv values are correct

    Examples:
      | rowindex |
      |        2 |


  @Foreign_Current_Accounts-Multiple-Filter_Invalid_[WEB]
  Scenario Outline: Foreign_Current_Accounts-Multiple-Filter_Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Assert element by class "button-bold" and contains text "Edit list"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_iban" is displayed

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
      |        2 |


  @Foreign_Current_Account-Transactions-Filter_By_Date-Predefined_Date_Range_[WEB]
  Scenario Outline: Foreign_Current_Account-Transactions-Filter_By_Date-Predefined_Date_Range_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for element by tag "nlb-product-detail-header"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert order of tabs in tablist "foreign"

    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker "foreign"

    And Click on button with tag "i" containing class "icon-calendar-today"
    And Assert window behind Date filter popup is blurred
    And Assert Select date title in Date filter
    And Assert three showed months are correctly displayed
    And Click on element by containing text "Cancel"
    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"

    Then Click on element by containing text "Last 7 days"
    And Assert from to dates are in last 7 days
    And Click on element by containing text "Confirm"

    And Click on element by containing text "This month"
    And Assert date range in Date filter are in "current month"
    And Click on element by containing text "Confirm"

    And Click on element by containing text "Last month"
    And Assert date range in Date filter are in "previous month"
    And Click on element by containing text "Confirm"

    Examples:
      | rowindex |
      |        1 |


  @Current_Foreign_Accounts-Transactions_List_[WEB]
  Scenario Outline: Current_Foreign_Accounts-Transactions_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for first transaction in Product details
#    And Assert available balance and current balance in header
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_iban"
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

    And Scroll to first transaction in Products details
#    And Assert there are 30 transactions loaded in Products details
#    And Scroll dynamic page down 1 times
#    And Assert there are 60 transactions loaded in Products details
    #And Assert there are more than 30 transactions loaded in Products details
    And Assert there are month categories in transactions list in Products details
    And Assert transaction dates are ordered correctly
    And Scroll element by contains text "Transactions" up
    And Assert element by xPath "//h3[contains(@class, 'heading-5')]" is displayed
    And Assert element by contains class "heading-5 ng-star-inserted" is displayed
    And Assert list of elements containing class "category-icon" are displayed
    And Assert list of elements containing class "medium tw-flex" are displayed
    And Assert list of elements containing class "caption medium tw-text" are displayed
    And Assert list of elements containing class "5 tw-flex tw-justify" are displayed

    Examples:
      | rowindex |
      |        1 |

  @Foreign_Current_Accounts-Transactions_List_select_Currency_[WEB]
  Scenario Outline: Foreign_Current_Accounts-Transactions_List_select_Currency_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Wait for element by tag "nlb-product-detail-header"

    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_iban"
    And Assert EUR currency is selected if product has more than one currency
    And Assert currency cards have Available and Current balance displayed correctly
    And Assert tabs in Product details are displayed correctly for Current Foreign Accounts
    And Scroll to first transaction in Products details
    And Assert transaction is displayed correctly in Products details with currency "EUR"
    And Assert amount for month category is displayed in Products details with currency "EUR"
    And Assert there are month categories in transactions list in Products details
    And Assert transaction dates are ordered correctly

    Then Scroll to Currency card for "USD" in Product details
    And Select Currency card "USD" in Product details
    And Wait for first transaction in Product details
    And Scroll to first transaction in Products details
    And Assert transaction is displayed correctly in Products details with currency "USD"
    And Assert amount for month category is displayed in Products details with currency "USD"
    And Assert there are month categories in transactions list in Products details
    And Assert transaction dates are ordered correctly

    Examples:
      | rowindex |
      |        1 |


  @Current_Foreign_Accounts_Product_Details_Financial_Details_Is_Not_Visible_[WEB]
  Scenario Outline: Current_Foreign_Accounts_Product_Details_Financial_Details_Is_Not_Visible_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element from Excel "<rowindex>" contains text columnName "current_account_1_iban"
    And Wait for element by contains text "Transactions"
    And Click on element by text "Details"
    And Wait for product details to load
    And Assert element with text "Financial details" is not displayed
    
    Then Assert that products in my products have loaded
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_iban"
    And Wait for element by contains text "Transactions"
    And Click on element by text "Details"
    And Wait for product details to load
    And Assert element with text "Financial details" is not displayed

    Examples:
      | rowindex |
      |        2 |


  @Current_Foreign_Accounts-Transactions_List_No_Transactions_[WEB]
  Scenario Outline: Current_Foreign_Accounts-Transactions_List_No_Transactions_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_iban"
    And Assert element by contains text "Transactions"
    #TO DO: Assertovanje Statements-a ili elementa koji treba da bude umesto njega
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert element by contains text "Filters"
    And Click on element by containing text "Filters"
    And Scroll element by contains text "Details" into view

    #Assertovanje Date Range (labela datuma od-do)
    Then Assert element by xPath "//label[text()='From']/following-sibling::div"
    And Assert element by xPath "//label[text()='To']/following-sibling::div"
    #Assertovanje Tipa transakcije
    And Assert element by contains text "All"
    And Assert element by contains text "Incoming transactions"
    And Assert element by contains text "Outgoing transactions"
    #Assertovanje Amount-a (labela iznosa od-do)
    And Assert element by xPath "//label[text()='From ']/following-sibling::div"
    And Assert element by xPath "//label[text()='To ']/following-sibling::div"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Clear filters"
    And Assert element by contains text "Download transaction list"
#    And Assert element by tag "div" has text "There are no transactions to be displayed."
    And Assert element by tag "div" has text "Products_Common_TransactionsList_EmptyState"

    Examples:
      | rowindex |
      |        2 |


  @Current_Foreign_Accounts-Transactions_Filter_By_Date-Date_Picker_[WEB]
  Scenario Outline: Current_Foreign_Accounts-Transactions_Filter_By_Date-Date_Picker_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_iban"

    And Click on element by aria label "Open or close filters"
    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"
    #Otvaranje kalendara
    And Click on button with tag "i" containing class "icon-calendar-today"
    And Assert three showed months are correctly displayed
    And Assert window behind Date filter popup is blurred
    And Assert Select date title in Date filter

    And Select date in From label to be "26.03.2025"
    And Select date in To label to be "15.05.2025"
    And Scroll element by contains text " Confirm " into view
    And Click on element by text " Confirm "
    And Scroll element by contains text "end of the list" into view
    And Assert transaction dates are between "26.03.2025" and "15.05.2025"
    And Scroll element by contains text " Clear filters " into view
    And Click on element by text " Clear filters "

    Examples:
      | rowindex |
      |        2 |


  @Current_Foreign_Accounts-Transactions-Filter_By_Amount_[WEB]
  Scenario Outline: Current_Foreign_Accounts-Transactions-Filter_By_Amount_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert there are both incoming and outgoing transactions
    And Click on element by aria label "Open or close filters"

    Then Assert Advanced filters Transaction type title
    And Assert Advanced filters Transaction types are correct
    And Assert Advanced filters Amount range title
    And Assert Advanced filters Amount range fields for Foreign accounts are correct displayed
    And Assert NLB button "Clear filters"
    And Assert NLB button "Confirm"
    And Assert All is selected in Transaction type by default
    And Enter "15,00" to Amount filter "From"
    And Enter "550,00" to Amount filter "To"
    And Assert Amount filter field "From" has value "15,00"
    And Assert Amount filter field "To" has value "550,00"
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert transaction amounts after filter are between 15 and 550
    And Click on NLB button "Clear filters"
    And Wait for first transaction in Product details
    And Assert that transaction amounts after filter disabling are not only between 15 and 550

    Examples:
      | rowindex |
      |        2 |


  @Current_Foreign_Accounts-Transactions-Filter_By_Amount_Invalid_[WEB]
  Scenario Outline: Current_Foreign_Accounts-Transactions-Filter_By_Amount_Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_iban"
    And Assert element by contains text "Transactions"
    #TO DO: Assertovanje Card Settings-a ili elementa koji treba da bude umesto njega
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert element by contains text "Filters"
    And Click on element by containing text "Filters"
    And Scroll element by contains text "Details" into view

    #Assertovanje Date Range (labela datuma od-do)
    Then Assert element by xPath "//label[text()='From']/following-sibling::div"
    And Assert element by xPath "//label[text()='To']/following-sibling::div"
    #Assertovanje Tipa transakcije
    And Assert element by contains text "All"
    And Assert element by contains text "Incoming transactions"
    And Assert element by contains text "Outgoing transactions"
    #Assertovanje Amount filtera (labela iznosa od-do)
    And Assert element by xPath "//label[text()='From ']/following-sibling::div"
    And Assert element by xPath "//label[text()='To ']/following-sibling::div"
    And Assert element by contains text "Confirm"
    And Assert element by contains text "Clear filters"
    And Assert element by contains text "Download transaction list "
    And Assert All is selected in Transaction type by default
    And Enter "2000" to Amount filter "From"
    And Enter "500" to Amount filter "To"
    And Click on element by containing text "Confirm"

#    Then Assert NLB Validation error "From amount must be smaller than To amount."
#    And Assert element by tag "div" has text "There are no transactions to be displayed."
    Then Assert element by contains text "ValidationError"
    Then Assert element by contains text "EmptyState"

    Examples:
      | rowindex |
      |        2 |


  @Current_Foreign_Accounts-Transactions_Filter-Invalid_[WEB]
  Scenario Outline: Current_Foreign_Accounts-Transactions_Filter-Invalid_[WEB]
    #Current_Foreign/Savings_Accounts-Transactions_Filter-invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_iban"
    And Assert element by contains text "Transactions"
    #TO DO: Assertovanje Card Settings-a ili elementa koji treba da bude umesto njega
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert element by contains text "Filters"
    And Click on element by containing text "Filters"
    And Scroll element by contains text "Details" into view

    #Assertovanje Date Range (labela datuma od-do)
    Then Assert element by xPath "//label[text()='From']/following-sibling::div"
    And Assert element by xPath "//label[text()='To']/following-sibling::div"

    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"
    And Assert NLB button "Clear filters"
    And Assert NLB button "Confirm"
    #Otvaranje kalendara
    And Click on button with tag "i" containing class "icon-calendar-today"
    And Assert window behind Date filter popup is blurred
    And Assert Select date title in Date filter

    And Select date in From label to be "22.01.2026"
    And Click on calendar icon with index "2"
    And Assert date "11.01.2026" is not clickable

    Examples:
      | rowindex |
      |        2 |

  @Foreign_Current_Accounts-Transactions-Search_[WEB]
  Scenario Outline: Foreign_Current_Accounts-Transactions-Search_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    #User is logged into aplication and clicks on the My Products page frome the menu
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold" and contains text "Edit list"

    #User clicks on a current account on the My Products page
    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_3_iban"
    And Wait for element by tag "nlb-product-detail-header"

    And Wait for element by tag "input" attribute "placeholder" with value "Search..."
    And Assert element by tag "input" and type "search"

    #Search by PURPOSE  -- BUG - NE MOZE DA SE UNESE SPACE KARAKTER
    And Enter text "stare" in field by tag "input" attribute "placeholder" and attribute value "Search..."
    And Wait for first transaction in Product details
    And Wait for "3" seconds
    And Assert transactions in Product details have Purpose "stare"
    And Click on NLB icon close
    And Wait for first transaction in Product details

        #Search by AMOUNT  -- BUG - NE PREPOZNAJE 150.000, SAMO 150000

    And Enter text "69913,01" in field by tag "input" attribute "placeholder" and attribute value "Search..."
    And Wait for first transaction in Product details
    And Wait for "3" seconds
    And Assert transactions in Product details have Amount "69.913,01"
    And Click on NLB icon close
    And Wait for first transaction in Product details

    #TO-DO!!!
    #Search by CREDITOR NAME

    #Search by BIC

    #Search by Reference

    Examples:
      | rowindex |
      |        3 |