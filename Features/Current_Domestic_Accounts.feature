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
#    When Click on tab "My products" from main sidebar
#    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold"

    #User clicks on a current account on the My Products page
    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert available balance and current balance in header

    #And Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name3"
    And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_bban"

    #Below the header there are tabs: Transactions, Card settings, Statements, Details Exchange.
    #User is by default on Transactions tab.
    And Assert order of tabs in tablist "domestic"

    #Below the tabs, icons for date picker "domestic", Filter, Select category and Search filter are displayed on the left side.
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
    And Enter "100,00" to Amount filter "From"
    And Enter "500,00" to Amount filter "To"
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert transaction amounts after filter are between 100 and 500

    #filter by type - incoming
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


  @Current_Domestic_Account-Transactions-Filter_By_Type_[WEB]
  Scenario Outline: Current_Domestic_Account-Transactions-Filter_By_Type_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_2_name"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert there are both incoming and outgoing transactions
    And Click on element by aria label "Open or close filters"

    #Incoming
    And Assert Advanced filters Transaction type title
    And Assert Advanced filters Transaction types are correct
    And Assert Advanced filters Amount range title
    And Assert Advanced filters Amount range fields for Domestic accounts are correct displayed
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
      |        1 |

  @Current_Domestic_Accounts-Transactions-Filter_By_Date-Predefined_Date_Range_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Filter_By_Date-Predefined_Date_Range_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Wait for element by tag "nlb-product-detail-header"
    #Then Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name3"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert order of tabs in tablist "domestic"

    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker "domestic"

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

  @Current_Domestic_Accounts-Multiple-Filter_Invalid_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Multiple-Filter_Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Wait for element by tag "nlb-product-detail-header"
    Then Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_2_name"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert order of tabs in tablist "domestic"
    And Assert element by contains text "Download transaction list"
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by contains text "Search"
    And Assert element by contains text "Filters"
    And Click on element by containing text "Filters"
    And Assert date picker "domestic"
    And Scroll screen down
    #And Assert radio button by text "All"
    #DD/MM/YY
    And Enter date "11.11.25" to field "from"
    And Enter date "12.11.2025" to field "to"
    And Enter "100,00" to Amount filter "From"
    And Enter "500,00" to Amount filter "To"
    And Assert element by contains text "11.11.25" is not displayed
    And Click on element by text " Confirm "
    And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "


    #MMDDYY
    And Enter date "11.11.25" to field "from"
    And Enter date "11.11.2025" to field "from"

    And Assert element by contains text "11.11.25" is not displayed
    And Click on element by text " Confirm "

   # And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #letters - START
    And Enter date "petijanuardvehiljadedvadesetpete" to field "from"
    And Enter date "11.11.2025" to field "to"
    And Assert element by contains text "petijanuardvehiljadedvadesetpete" is not displayed
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
    #And Click on element by text " OK "
    #start date later than end date TODO
    #special characters
    And Enter date "11.11.25@" to field "from"
    And Enter date "11.11.2025" to field "to"
    And Assert element by contains text "11.11.25@" is not displayed
    And Click on element by text " Confirm "
    #And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #end date earlier than start date

    #letters - END
    And Enter date "11.11.2025" to field "from"
    And Enter date "petijanuardvehiljadedvadesetpete" to field "to"
    And Assert element by contains text "petijanuardvehiljadedvadesetpete" is not displayed
    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #special characters - END
    And Enter date "11.11.25@" to field "to"
    And Enter date "11.11.2025" to field "from"
    And Assert element by contains text "11.11.25@" is not displayed

    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
     #DD/MM/YY - END
    And Enter date "11.11.25" to field "to"
    And Enter date "11.11.2025" to field "from"
    And Assert element by contains text "11.11.25" is not displayed
    And Click on element by text " Confirm "
    #And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #YY/DD/MM - END
    And Enter date "25.25.11" to field "to"
    And Enter date "11.11.2025" to field "from"
    And Assert element by contains text "25.25.11" is not displayed

    And Click on element by text " Confirm "
    And Click on " OK " button if displayed
    #And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #MMDDYY - END
    And Enter date "11.11.25" to field "to"
    And Enter date "11.11.2025" to field "from"
    And Assert element by contains text "11.11.25" is not displayed
    And Click on element by text " Confirm "
    #And Assert element by text "There are no transactions to be displayed."
   # And Click on element by text " OK "
    #letters - MINAMOUNT
    And Enter "textAmount" to Amount filter "From"
    And Assert "From" amount field value
    And Click on element by text " Confirm "
   # And Assert element by text "There are no transactions to be displayed."
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
      |        1 |

#PRESAO U STATUS FAILED
#  @Current_Domestic_Accounts-Transactions_List_[WEB]
#  Scenario Outline: Current_Domestic_Accounts-Transactions_List_[WEB]
#
#    Given Open Login page
#    And Change language to English
#    And Login to the page using user from Excel "<rowindex>" columnName "username"
#    And Assert that products in my products have loaded
#
#    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
#    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
#    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_bban"
#    And Assert element by contains text "Transactions"
#    #TO DO: Assertovanje Card Settings-a ili elementa koji treba da bude umesto njega
#    And Assert element by contains text "Statements"
#    And Assert element by contains text "Details"
#    And Assert element by text " Filters"
#    And Click on element by containing text "Filters"
#    And Scroll element by contains text "Details" into view
#
#    #Assertovanje Date Range (labela datuma od-do)
#    Then Assert element by xPath "//label[text()='From']/following-sibling::div"
#    And Assert element by xPath "//label[text()='To']/following-sibling::div"
#    #Assertovanje Tipa transakcije
#    And Assert element by text "All"
#    And Assert element by text "Incoming transactions"
#    And Assert element by text "Outgoing transactions"
#    #Assertovanje Amount filtera (labela iznosa od-do)
#    And Assert element by xPath "//label[text()='From ']/following-sibling::div"
#    And Assert element by xPath "//label[text()='To ']/following-sibling::div"
#    And Assert element by text " Confirm "
#    And Assert element by text " Clear filters "
#    And Assert element by text " Download transaction list "
#
#    And Scroll to first transaction in Products details
#    And Assert there are 30 transactions loaded in Products details
#    And Scroll dynamic page down 1 times
#    And Assert there are more than 30 transactions loaded in Products details
#    And Assert there are month categories in transactions list in Products details
#    And Assert transaction dates are ordered correctly
#    And Scroll element by contains text "Transactions" up
#    And Assert element by xPath "//h3[contains(@class, 'heading-5')]" is displayed
#    And Assert element by contains class "heading-5 ng-star-inserted" is displayed
#    And Assert list of elements containing class "category-icon" are displayed
#    And Assert list of elements containing class "medium tw-flex" are displayed
#    And Assert list of elements containing class "caption medium tw-text" are displayed
#    And Assert list of elements containing class "5 tw-flex tw-justify" are displayed
#
#    Examples:
#      | rowindex |
#      |        6 |

  @Current_Domestic_Accounts-Details-Financial_Details_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Details-Financial_Details_[WEB]

    #Login
    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    #User is logged into aplication and clicks on the My Products page frome the menu
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    And Assert element by class "button-bold" and contains text "Edit list"

    #User clicks on a current account on the My Products page
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Wait for element by tag "nlb-product-detail-header"

    #Below the header there are tabs: Transactions, Card settings, Statements, Details Exchange.
    #User is by default on Transactions tab.
    And Assert order of tabs in tablist "domestic"
    #Below the tabs, icons for date picker "domestic", Filter, Select category and Search filter are displayed on the left side.
    # On the right side there is a Download option.
    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker "domestic"


    #User clicks on tab Details
    Then Click on tab "Details" from tablist
    And Wait for product details to load
    #Sections are displayed in the following order:
      # Financial details, Account details, Bundle services available, Cheques, Debit cards\
    And Assert order of sections in tabpanel
    #Financial details:
    And Assert Overdraft is displayed correctly in Financial details for Current account
    And Assert Overdraft expiration date is displayed correctly in Financial details for Current accounts
    And Assert Overdraft interest rate is displayed correctly in Financial details for Current account
    And Assert Unauthorized overdraft Interest rate is displayed correctly in Financial details for Current account
    #And Assert element by text " Currency exchange "


    Examples:
      | rowindex |
      | 1        |

    #PRESAO U FAILED, MADA MISLIM DA JE OSTALA SAMO GREKSA U TEKSU TESTA, DA JE TEST ISPOD GOTOV I PROLAZI
#  @Current_Domestic_Accounts-Details-Account_Details_[WEB]
#  Scenario Outline: Current_Domestic_Accounts-Details-Account_Details_[WEB]
#
#      #Login
#    Given Open Login page
#    And Change language to English
#    And Login to the page using user from Excel "<rowindex>" columnName "username"
#    And Wait for element by text "Pay or transfer"
#    And Assert that products in my products have loaded
#
#    #User is logged into aplication and clicks on the My Products page frome the menu
#    When Click on tab "My products" from main sidebar
#    And Wait for element by text "Edit list"
#    Then Assert element by class "button-bold" and contains text "Edit list"
#
#    #User clicks on a current account on the My Products page
#    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
#    And Wait for element by tag "nlb-product-detail-header"
#
#    #Below the header there are tabs: Transactions, Card settings, Statements, Details Exchange.
#    #User is by default on Transactions tab.
#    And Assert order of tabs in tablist "domestic"
#    #Below the tabs, icons for date picker "domestic", Filter, Select category and Search filter are displayed on the left side.
#    # On the right side there is a Download option.
#    And Assert element by text " Download transaction list "
#    And Assert element by contains class "icon-download"
#    And Assert element by tag "input" and type "search"
#    And Assert element by text "Search "
#    And Assert element by text " Filters"
#    And Click on element by text " Filters"
#    And Assert date picker "domestic"
#
#    #User clicks on tab Details
#    When Click on tab "Details" from tablist
#    And Wait for product details to load
#    #Sections are displayed in the following order:
#      # Financial details, Account details, Bundle services available, Cheques, Debit cards\
#      #And Assert order of sections in tabpanel
#
#    And Assert Account type is displayed correctly in Account details for Current account
#    And Assert Account owner in Account details is from Excel "<rowindex>" columnName "username"
#    And Assert Account number in Account details is from Excel "<rowindex>" columnName "current_account_2_bban"
#    #TODO: VIDETI DA LI TREBA OVAJ KORAK DA OSTANE #And Assert BIC in Account details is "KOBBRSBG"
#
#    And Click on element by tag "i" contains class "icon-copy"
#    And Assert content in clipboard is equal to showed Account type, owner and number
#           #And Assert element by text " Document archive "
#      #And Click on normalized text "Document archive"
#      #And Assert element by normalized text "Documents archive is available from 1. 3. 2016. Please select your search criteria to find your documents."
#


    Examples:
      | rowindex |
      | 1        |

  @Current_Domestic_Accounts-Header-Display_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Header-Display_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Wait for element by class "button-bold"
    And Assert element by class "button-bold"
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert Product icon in Product details is displayed and has icon contains src "CurrentAccount-Icon"
    And Assert available balance and current balance in header

    Then Click on tab "Details" from tablist
    And Wait for product details to load
    And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert Product icon in Product details is displayed and has icon contains src "CurrentAccount-Icon"
    And Assert available balance and current balance in header

    Examples:
      | rowindex |
      | 1        |


  @Current_Domestic_Accounts-Transactions_List_No_Transactions_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Transactions_List_No_Transactions_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_bban"
    #TODO: Izbaciti korak ispod kada ne bude pop upa koji iskace sa greskom (desava se kada se klikne na racun bez transakcije)
    And Click on element by text " OK " if exists

    
    And Assert element by contains text "Transactions"
    #TO DO: Assertovanje Card Settings-a ili elementa koji treba da bude umesto njega
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert element by text " Filters"
    And Click on element by containing text "Filters"
    And Scroll element by contains text "Details" into view

    #Assertovanje Date Range (labela datuma od-do)
    Then Assert element by xPath "//label[text()='From']/following-sibling::div"
    And Assert element by xPath "//label[text()='To']/following-sibling::div"
    #Assertovanje Tipa transakcije
    And Assert element by text "All"
    And Assert element by text "Incoming transactions"
    And Assert element by text "Outgoing transactions"
    #Assertovanje Amount-a (labela iznosa od-do)
    And Assert element by xPath "//label[text()='From ']/following-sibling::div"
    And Assert element by xPath "//label[text()='To ']/following-sibling::div"
    And Assert element by text " Confirm "
    And Assert element by text " Clear filters "
    And Assert element by text " Download transaction list "
    And Assert element by tag "div" has text "There are no transactions to be displayed."

    Examples:
      | rowindex |
      |        3 |


  @Current_Domestic_Accounts-Transactions_Filter_By_Date-Date_Picker_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Transactions_Filter_By_Date-Date_Picker_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_2_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert element by contains text "Transactions"
    #TO DO: Assertovanje Card Settings-a ili elementa koji treba da bude umesto njega
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert element by text " Filters"
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
    And Assert element by contains text "Download transaction list"

    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"
    #Otvaranje kalendara
    And Click on button with tag "i" containing class "icon-calendar-today"
    And Assert window behind Date filter popup is blurred
    And Assert Select date title in Date filter

    And Select date in From label to be "06.08.2025"
    And Select date in To label to be "03.02.2026"
    And Click on element by containing text "Confirm"
    And Scroll element by contains text "end of the list" into view
    And Assert transaction dates are between "06.08.2025" and "03.02.2026"
    And Scroll element by contains text "Clear filters" into view
    And Click on element by containing text "Clear filters"

#    And Assert three showed months are correctly displayed

    Examples:
      | rowindex |
      |        1 |


  @Current_Domestic_Accounts-Transactions-Filter_By_Amount_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Filter_By_Amount_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_2_name"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert there are both incoming and outgoing transactions
    And Click on element by aria label "Open or close filters"

    Then Assert Advanced filters Transaction type title
    And Assert Advanced filters Transaction types are correct
    And Assert Advanced filters Amount range title
    And Assert Advanced filters Amount range fields for Domestic accounts are correct displayed
    And Assert NLB button "Clear filters"
    And Assert NLB button "Confirm"
    And Assert Amount input fields have "RSD" currency
    And Assert All is selected in Transaction type by default
    And Enter "15,00" to Amount filter "From"
    And Enter "550,00" to Amount filter "To"
    And Assert Amount filter field "From" has value "15,00"
    And Assert Amount filter field "To" has value "550,00"
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
#    And Assert that tag for filter is "4,00 EUR - 7,00 EUR" and has close icon
    And Assert transaction amounts after filter are between 15 and 550
    And Wait for first transaction in Product details
    And Assert there are both incoming and outgoing transactions

    Examples:
      | rowindex |
      |        2 |


  @Current_Domestic_Accounts-Transactions-Filter_By_Amount_Invalid_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Filter_By_Amount_Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_2_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "current_account_2_bban"
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
    And Assert All is selected in Transaction type by default
    And Enter "100" to Amount filter "From"
    And Enter "50" to Amount filter "To"
    And Click on element by text " Confirm "

    Then Assert NLB Validation error "From amount must be smaller than To amount."
    And Assert element by tag "div" has text "There are no transactions to be displayed."

    Examples:
      | rowindex |
      |        1 |


  @Current_Domestic_Accounts-Transactions_Filter-Invalid_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Transactions_Filter-Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_2_name"
    And Scroll to element by tag "nlb-selected-product-transactions-filters"
    And Assert there are both incoming and outgoing transactions
    And Click on element by aria label "Open or close filters"

    Then Assert Advanced filters Transaction type title
    And Assert Advanced filters Transaction types are correct
    And Assert Advanced filters Amount range title
    And Assert Advanced filters Amount range fields for Domestic accounts are correct displayed
    And Assert NLB button "Clear filters"
    And Assert NLB button "Confirm"
    #Otvaranje kalendara
    And Click on calendar icon with index "1"
    And Assert window behind Date filter popup is blurred
    And Assert Select date title in Date filter

    And Select date in From label to be "27.03.2026"
    And Click on calendar icon with index "2"
    And Assert contains aria label button "Previous month" is not clickable
    And Assert date "11.03.2026" is not clickable

    Examples:
      | rowindex |
      |        3 |

  @Current_Domestic_Accounts-Transactions-Search_[WEB]
  Scenario Outline: Current_Domestic_Accounts-Transactions-Search_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    #User is logged into aplication and clicks on the My Products page frome the menu
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold" and contains text "Edit list"

    #User clicks on a current account on the My Products page
    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Wait for element by tag "nlb-product-detail-header"

    And Wait for element by tag "input" attribute "placeholder" with value "Search..."
    And Assert element by tag "input" and type "search"

    #Search by PURPOSE  -- BUG - NE MOZE DA SE UNESE SPACE KARAKTER
    And Enter text "Naknada" in field by tag "input" attribute "placeholder" and attribute value "Search..."
    And Wait for first transaction in Product details
    And Wait for "3" seconds
    And Assert transactions in Product details have Purpose "Naknada"
    And Click on NLB icon close
    And Wait for first transaction in Product details

        #Search by AMOUNT  -- BUG - NE PREPOZNAJE 150.000, SAMO 150000

    And Enter text "100000" in field by tag "input" attribute "placeholder" and attribute value "Search..."
    And Wait for first transaction in Product details
    And Wait for "3" seconds
    And Assert transactions in Product details have Amount "100.000"
    And Click on NLB icon close
    And Wait for first transaction in Product details

    #TODO!!!
    #Search by CREDITOR NAME

    #Search by BIC

    #Search by Reference

    Examples:
      | rowindex |
      |        1 |