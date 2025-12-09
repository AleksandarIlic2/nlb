Feature: Current_Domestic_Accounts

  @Current_Domestic_Accounts-Transactions-Download_option_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Download_option_[WEB]

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
    When Click on element by containing text from Excel "<rowindex>" columnName "personal_account_iban3"
    And Wait for element by tag "nlb-product-detail-header"

    And Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name3"
    And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "personal_account_iban3"

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
    And Select transaction type "Incoming transactions" in Advanced filters
    And Assert Incoming transactions is selected in Transaction type
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert there are only Incoming transactions in transactions list

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
      |        1 |


  @Current_Domestic_Account-Transactions-Filter_By_Type_[WEB]
  Scenario Outline: Current_Domestic_Account-Transactions-Filter_By_Type_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "personal_account_iban3"
    And Wait for element by tag "nlb-product-detail-header"
    Then Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name3"
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
    #And Assert radio button by text "All"
    And Select radio button by text "Incoming transactions"
    And Click on element by text " Confirm "
    And Assert there are only "Incoming transactions" transactions in transactions list
    And Assert transaction dates are ordered correctly
      #TODO: OVO ENAIBLE KAD BUDE NOVI RELEASE
        # And Assert Assert there are only Incoming transactions by icon
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
      |        1 |

  @Current_Domestic_Accounts-Transactions-Filter_By_Date-Predefined_Date_Range_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Filter_By_Date-Predefined_Date_Range_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "personal_account_iban3"
    And Wait for element by tag "nlb-product-detail-header"
    Then Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name3"
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
    #And Assert three showed months are correctly displayed
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
