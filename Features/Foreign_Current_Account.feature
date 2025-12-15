Feature: Foreign_Current_Account

  @Foreign_Current_Account_Product_Details_Account_Details_[WEB]
  Scenario Outline: Foreign_Current_Account_Product_Details_Account_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    When Wait for element by text "Pay or transfer"

    #And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_name"
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold" and contains text "Edit list"
    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Click on element by text "Details"

    #And Scroll screen down
    And Assert element by text "Account details" index "2" is displayed
    And Assert element by tag "nlb-icon" and attribute "name" with value "icon-copy"
    And Assert that element "Account type" has value "Current account"
    And Assert that element "BIC" has value "KOBBRSBG"
    And Assert that element "Account owner" is equal to value from Excel "<rowindex>" columnName "username"
    And Assert that element "Account number" is equal to value from Excel "<rowindex>" columnName "current_account_1_bban"



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

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for element by tag "nlb-product-detail-header"
    #Then Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert order of tabs in tablist
    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker
    #Incoming
    And Scroll screen down
    And Assert radio button by text "All"
    And Select radio button by text "Incoming transactions"
    And Click on element by text " Confirm "
    And Assert there are only "Incoming transactions" transactions in transactions list
    And Assert transaction dates are ordered correctly
    And Click on element by text " Clear filters "
    And Click on element by text " Filters"
    And Assert date picker
    And Scroll screen down
    And Select radio button by text "Outgoing transactions"
    And Click on element by text " Confirm "
    And Assert there are only "Outgoing transactions" transactions in transactions list
    And Assert transaction dates are ordered correctly

    And Click on element by text " Clear filters "
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
    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for element by tag "nlb-product-detail-header"

    #And Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name"
    And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_bban"

    #Below the header there are tabs: Transactions, Card settings, Statements, Details Exchange.
    #User is by default on Transactions tab.
    And Assert order of tabs in tablist

    #Below the tabs, icons for Date picker, Filter, Select category and Search filter are displayed on the left side.
      # On the right side there is a Download option
    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker

    #User Filters the list with valid parameters

    #filter by amount
    And Enter "100,00" to Amount filter "From"
    And Enter "500,00" to Amount filter "To"
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert transaction amounts after filter are between 100 and 500

    #filter by type - incoming
    And Select transaction type "Outgoing transactions" in Advanced filters
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert there are only Outgoing transactions in transactions list

    Then Remember transactions
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

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for element by tag "nlb-product-detail-header"
    #TODO: Vrati ovaj korak ispod kad se utvrdi ime racuna
    #Then Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert order of tabs in tablist
    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker
    And Scroll screen down
    #And Assert radio button by text "All"
    #DD/MM/YY
    And Enter date "11.11.25" to field "from"
    And Enter date "12.11.2025" to field "to"
    And Enter "100,00" to Amount filter "From"
    And Enter "500,00" to Amount filter "To"
    And Assert "From" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #YY/DD/MM
    #TODO proveri: Komentar, datum 25.25.11 izbacuje gresku (kada drugi broj bude preko 12?)
    #TODO: Iako je datum 25.11.11 (neispravan format) MOZE SE FILTRIRATI! - BUG?
    And Enter date "25.11.11" to field "from"
    And Assert "From" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #MMDDYY
    And Enter date "11.11.25" to field "from"
    And Assert "From" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #letters - START
    And Enter date "petijanuardvehiljadedvadesetpete" to field "from"
    And Assert "From" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #start date later than end date TODO
    #special characters
    And Enter date "11.11.25@" to field "from"
    And Assert "From" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #end date earlier than start date

    #letters - END
    And Enter date "11.11.25" to field "from"
    And Enter date "petijanuardvehiljadedvadesetpete" to field "to"
    And Assert "To" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #special characters - END
    And Enter date "11.11.25@" to field "to"
    And Assert "To" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
     #DD/MM/YY - END
    And Enter date "11.11.25" to field "to"
    And Assert "To" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #YY/DD/MM - END
    And Enter date "25.25.11" to field "to"
    And Assert "To" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #MMDDYY - END
    And Enter date "11.11.25" to field "to"
    And Assert "To" Field has error "Field must be a date."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #letters - MINAMOUNT
    And Enter "textAmount" to Amount filter "From"
    And Assert "From" amount field value
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #specialCharacters - MINAMOUNT

    And Enter "@@@" to Amount filter "From"
    And Assert "From" amount field value
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #Min amount higher than Max amount
    And Enter "200,00" to Amount filter "From"
    And Enter "100,00" to Amount filter "To"
    And Assert element by text "From amount must be smaller than To amount."
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
  #  And Click on element by text " OK "
    #letters - MAXAMOUNT
    And Enter "asdasdasd" to Amount filter "To"
    And Assert "To" amount field value
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #specialcharacters - MAXAMOUT
    And Enter "@@@" to Amount filter "To"
    And Assert "To" amount field value
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
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

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for element by tag "nlb-product-detail-header"
    #Then Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name3"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert order of tabs in tablist

    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker

    And Click on button with tag "i" containing class "icon-calendar-today"
    And Assert window behind Date filter popup is blurred
    And Assert Select date title in Date filter
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