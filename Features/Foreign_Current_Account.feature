Feature: Foreign_Current_Account

  @Foreign_Current_Account_Product_Details_Account_Details_[WEB]
  Scenario Outline: Foreign_Current_Account_Product_Details_Account_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    When Wait for element by text "Pay or transfer"

    #And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_name"
    When Assert that products in my products have loaded
    And Wait for element by text "Edit list"
    And Assert element by class "button-bold" and contains text "Edit list"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Click on element by text "Details"

    #And Scroll screen down
    And Assert element by text "Account details" index "2" is displayed
    And Assert element by tag "nlb-icon" and attribute "name" with value "icon-copy"
    And Assert that element "Account type" has value "Current account"
    And Assert that element "BIC" has value "KOBBRSBG"
    And Assert that element "Account owner" is equal to value from Excel "<rowindex>" columnName "username"
    And Assert that element "Account number" is equal to value from Excel "<rowindex>" columnName "current_account_1_iban"



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

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
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

#    And Assert that tag for filter is "Incoming transactions" and has close icon
    Then Assert there are only Incoming transactions in transactions list
    And Click on element by containing text "Clear filters"
    And Wait for first transaction in Product details
    And Assert there are both incoming and outgoing transactions

    #Outgoing
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Click on element by aria label "Open or close filters"
#    And Wait for Advanced filters form
    And Assert All is selected in Transaction type by default
    And Select transaction type "Outgoing transactions" in Advanced filters
    And Assert Outgoing transactions is selected in Transaction type
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details

#    And Assert that tag for filter is "Outgoing transactions" and has close icon
    And Assert there are only Outgoing transactions in transactions list
    And Click on element by containing text "Clear filters"
    And Wait for first transaction in Product details
    And Assert there are both incoming and outgoing transactions

    Examples:
      | rowindex |
      |        4 |


  @Current_Foreign_Accounts-Transactions-Download_option_[WEB]
  Scenario Outline: Current_Foreign_Accounts-Transactions-Download_option_[WEB]

     #Login
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
    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for element by tag "nlb-product-detail-header"

    #And Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name"
    And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_iban"

    #Below the header there are tabs: Transactions, Card settings, Statements, Details Exchange.
    #User is by default on Transactions tab.
    And Assert order of tabs in tablist "foreign"

    #Below the tabs, icons for Date picker, Filter, Select category and Search filter are displayed on the left side.
      # On the right side there is a Download option
    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker "foreign"

    #User Filters the list with valid parameters

    #filter by amount
    And Enter "100,00" to Amount filter "From"
    And Enter "500,00" to Amount filter "To"
    And Click on NLB button "Confirm"
    And Wait for "10" seconds
    And Wait for first transaction in Product details
    And Assert transaction amounts after filter are between 100 and 500

    #filter by type - incoming
    And Select radio button by text "Incoming transactions"
    And Click on element by text " Confirm "
    And Wait for first transaction in Product details
    And Assert there are only "Incoming transactions" transactions in transactions list

    #And Assert there are only "Incoming transactions" transactions in transactions list

    Then Remember transactions "Incoming transactions"
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
      |        4 |


  @Foreign_Current_Accounts-Multiple-Filter_Invalid_[WEB]
  Scenario Outline: Foreign_Current_Accounts-Multiple-Filter_Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for element by tag "nlb-product-detail-header"
    #TODO: Vrati ovaj korak ispod kad se utvrdi ime racuna
    #Then Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert order of tabs in tablist "foreign"
    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker "foreign"
    And Scroll screen down
    #And Assert radio button by text "All"
    #DD/MM/YY
    And Enter date "11.11.2025" to field "from"
    And Enter date "10.10.2025" to field "to"
    And Enter "100,00" to Amount filter "From"
    And Enter "500,00" to Amount filter "To"
    And Assert "From" Field has error "Please check the date range"
    And Click on element by text " Confirm "
    #And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #YY/DD/MM
    #TODO proveri: Komentar, datum 25.25.11 izbacuje gresku (kada drugi broj bude preko 12?)
    #TODO: Iako je datum 25.11.11 (neispravan format) MOZE SE FILTRIRATI! - BUG?
#    And Enter date "25.11.11" to field "from"
#    And Assert "From" Field has error "Field must be a date."
#    And Click on element by text " Confirm "
#    And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #MMDDYY
    And Enter date "05.25.2025" to field "from"
    And Enter date "10.10.2025" to field "to"
    And Assert element by contains text "05.25.2025" is not displayed
    And Click on element by text " Confirm "
    #And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #letters - START
    And Enter date "petijanuardvehiljadedvadesetpete" to field "from"
    And Enter date "10.10.2025" to field "to"
    And Assert element by contains text "petijanuardvehiljadedvadesetpete" is not displayed
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #start date later than end date TODO
    #special characters
    And Enter date "11.11.25@" to field "from"
    And Enter date "10.10.2025" to field "to"
    And Assert element by contains text "11.11.25@" is not displayed
    And Click on element by text " Confirm "
   # And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #end date earlier than start date

    #letters - END
    And Enter date "petijanuardvehiljadedvadesetpete" to field "to"
    And Enter date "11.11.25" to field "from"
    And Assert element by contains text "petijanuardvehiljadedvadesetpete" is not displayed
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
    #special characters - END
    And Enter date "11.11.25@" to field "to"
    And Assert element by contains text "11.11.25@" is not displayed
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
     #DD/MM/YY - END
    And Enter date "11.11.25" to field "to"
    And Assert element by contains text "11.11.25" is not displayed
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
    #YY/DD/MM - END
    And Enter date "25.25.11" to field "to"
    And Assert element by contains text "25.25.11" is not displayed
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
    #MMDDYY - END
    And Enter date "11.11.25" to field "to"
    And Assert element by contains text "11.11.25" is not displayed
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
    #letters - MINAMOUNT
    And Enter "textAmount" to Amount filter "From"
    And Assert element by contains text "textAmount" is not displayed
    And Assert "From" amount field value
    And Click on element by text " Confirm "
    #And Assert element by text "There are no transactions to be displayed."
    #specialCharacters - MINAMOUNT

    And Enter "@@@" to Amount filter "From"
    And Assert element by contains text "@@@" is not displayed
    And Assert "From" amount field value
    And Click on element by text " Confirm "
    #And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #Min amount higher than Max amount
    And Enter "200,00" to Amount filter "From"
    And Enter "100,00" to Amount filter "To"
    And Assert element by text "From amount must be smaller than To amount."
    And Click on element by text " Confirm "
    #And Assert element by text "There are no transactions to be displayed."
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
    #And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    Examples:
      | rowindex |
      |        4 |


  @Foreign_Current_Account-Transactions-Filter_By_Date-Predefined_Date_Range_[WEB]
  Scenario Outline: Foreign_Current_Account-Transactions-Filter_By_Date-Predefined_Date_Range_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for element by tag "nlb-product-detail-header"
    #Then Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name3"
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
    #TODO: Korak ispod pada cesto
    And Assert three showed months are correctly displayed
    And Click on element by text " Cancel "
    And Assert element by text "Last 7 days "
    And Assert element by text "Current month"
    And Assert element by text " Previous month"


    #User clicks on the option Last 7 days - Last seven days counting from todays are selected. Displayed months are current month and 2 following months.

    And Click on element by text "Last 7 days "
    And Assert from to dates are in last 7 days
    And Click on element by text " Confirm "
    #TO DO  Assert displayed transaction are from last 7 days

    #TO DO User clicks on the x button in the pill with the value Last 7 days

    And Click on element by text "Current month"
    And Assert date range in Date filter are in "current month"
    And Click on element by text " Confirm "

    #TO DO Transaction list is filtered correctly displaying only transactions from this month. Under the filter icons, a pill with the value Month start date-Todays date in
    #TO DO User clicks on the x button in the pill with the value This month


    And Click on element by text " Previous month"
    And Assert date range in Date filter are in "previous month"
    And Click on element by text " Confirm "


    #TO DO Transaction list is filtered correctly displaying only transactions from Previous month. Under the filter icons, a pill with the value Month start date-Todays date in
    #TO DO User clicks on the x button in the pill with the value Previous month


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

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for element by tag "nlb-product-detail-header"

    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_iban"
    And Assert EUR currency is selected if product has more than one currency
    And Assert currency cards have Available and Current balance displayed correctly
    And Assert tabs in Product details are displayed correctly
    And Scroll to first transaction in Products details
    And Assert transaction is displayed correctly in Products details with currency "EUR"
    And Assert amount for month category is displayed in Products details with currency "EUR"
    And Assert there are month categories in transactions list in Products details
    And Assert transaction dates are ordered correctly

    Then Scroll to Currency card for "JPY" in Product details
    And Select Currency card "JPY" in Product details
    And Wait for first transaction in Product details
    And Scroll to first transaction in Products details
    And Assert transaction is displayed correctly in Products details with currency "JPY"
    And Assert amount for month category is displayed in Products details with currency "JPY"
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
    And Assert element with text "Financial details" is not displayed
    
    Then Assert that products in my products have loaded
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_iban"
    And Wait for element by contains text "Transactions"
    And Click on element by text "Details"
    And Assert element with text "Financial details" is not displayed

    Examples:
      | rowindex |
      |        1 |


  @Current_Foreign_Accounts-Transactions_List_No_Transactions_[WEB]
  Scenario Outline: Current_Foreign_Accounts-Transactions_List_No_Transactions_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_iban"
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
    #TODO: BUG sa nazivima, vratiti korak ispod kad proradi..
   # And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_2_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_iban"
    And Assert element by contains text "Transactions"
    #TO DO: Assertovanje Statements-a ili elementa koji treba da bude umesto njega
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

    And Select date in From label to be "26.03.2025"
    And Select date in To label to be "15.05.2025"
    And Scroll element by contains text " Confirm " into view
    And Click on element by text " Confirm "
    And Scroll element by contains text "end of the list" into view
    And Assert transaction dates are between "26.03.2025" and "15.05.2025"
    And Scroll element by contains text " Clear filters " into view
    And Click on element by text " Clear filters "

#    And Assert three showed months are correctly displayed

    Examples:
      | rowindex |
      |        3 |


  @Current_Foreign_Accounts-Transactions-Filter_By_Amount_[WEB]
  Scenario Outline: Current_Foreign_Accounts-Transactions-Filter_By_Amount_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert there are both incoming and outgoing transactions
    And Click on element by aria label "Open or close filters"

#    Then Assert Advanced filters Transaction type title
#    And Assert Advanced filters Transaction types are correct
#    And Assert Advanced filters Amount range title
#    And Assert Advanced filters Amount range fields for Foreign accounts are correct displayed
    And Assert NLB button "Clear filters"
    And Assert NLB button "Confirm"
    And Assert Amount input fields have "EUR" currency
    And Assert All is selected in Transaction type by default
    And Enter "3800" to Amount filter "From"
    And Enter "4100" to Amount filter "To"
    And Assert Amount filter field "From" has value "3.800,00"
    And Assert Amount filter field "To" has value "4.100,00"
    And Click on NLB button "Confirm"
#    And Assert Advanced filters Amount range fields for Foreign accounts are correct displayed
    And Wait for first transaction in Product details
#    And Assert that tag for filter is "4,00 EUR - 7,00 EUR" and has close icon
    And Assert transaction amounts after filter are between 3800 and 4100
    And Wait for first transaction in Product details
    And Assert there are both incoming and outgoing transactions

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
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_3_name"
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

    Then Assert NLB Validation error "From amount must be smaller than To amount."
    And Assert element by tag "div" has text "There are no transactions to be displayed."

    Examples:
      | rowindex |
      |        3 |


  @Current_Foreign_Accounts-Transactions_Filter-Invalid_[WEB]
  Scenario Outline: Current_Foreign_Accounts-Transactions_Filter-Invalid_[WEB]
    #Current_Foreign/Savings_Accounts-Transactions_Filter-invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_iban"
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
      |        3 |

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