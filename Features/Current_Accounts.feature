Feature: Current_Accounts


  @Current_Accounts-Transactions_List_select_Currency_[WEB]
  Scenario Outline: Current_Accounts-Transactions_List_select_Currency_[WEB]

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

    And Assert EUR currency is selected if product has more than one currency

    And Scroll to first transaction in Products details
    And Assert transaction is displayed correctly in Products details with currency "EUR"
    And Assert amount for month category is displayed in Products details with currency "EUR"

    And Assert there are month categories in transactions list in Products details
    And Assert transaction dates are ordered correctly


    #@[currentCard] USD
    And Scroll to Currency card for "USD" in Product details
    And Select Currency card "USD" in Product details
    Then Wait for first transaction in Product details
    And Scroll to first transaction in Products details
    And Assert transaction is displayed correctly in Products details with currency "USD"
    And Assert amount for month category is displayed in Products details with currency "USD"
    And Assert there are month categories in transactions list in Products details
    And Assert transaction dates are ordered correctly
    #30 transactions???

    Examples:
      | rowindex |
      |        4 |

  #TODO: Dostavljeni useri nemaju CHF
  #@Current_Accounts-Transactions_List_select_Currency_[WEB]_2
  #Scenario Outline: Current_Accounts-Transactions_List_select_Currency_[WEB]_2

    #Login
  #  Given Open Login page
  #  And Change language to English
  #  And Login to the page using user from Excel "<rowindex>" columnName "username"
  #  And Wait for element by text "Pay or transfer"
  #  And Assert that products in my products have loaded

    #User is logged into aplication and clicks on the My Products page frome the menu
  #  When Click on tab "My products" from main sidebar
  #  And Wait for element by text "Edit list"
  #  Then Assert element by class "button-bold" and contains text "Edit list"

    #User clicks on a current account on the My Products page
  #  When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
  #  And Wait for element by tag "nlb-product-detail-header"

  #  And Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name"
  #  And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_bban"

    #Below the header there are tabs: Transactions, Card settings, Statements, Details Exchange.
    #User is by default on Transactions tab.
  #  And Assert order of tabs in tablist

    #Below the tabs, icons for Date picker, Filter, Select category and Search filter are displayed on the left side.
      # On the right side there is a Download option
  #  And Assert element by text " Download transaction list "
  #  And Assert element by contains class "icon-download"
  #  And Assert element by tag "input" and type "search"
  #  And Assert element by text "Search "
  #  And Assert element by text " Filters"
  #  And Click on element by text " Filters"
  #  And Assert date picker

  #  And Assert EUR currency is selected if product has more than one currency

  #  And Scroll to first transaction in Products details
  #  And Assert transaction is displayed correctly in Products details with currency "EUR"
  #  And Assert amount for month category is displayed in Products details with currency "EUR"

  #  And Assert there are month categories in transactions list in Products details
  #  And Assert transaction dates are ordered correctly


    #@[currentCard] CHF
  #  And Scroll to Currency card for "CHF" in Product details
  #  And Select Currency card "CHF" in Product details
  #  Then Wait for first transaction in Product details
  #  And Scroll to first transaction in Products details
  #  And Assert transaction is displayed correctly in Products details with currency "CHF"
  #  And Assert amount for month category is displayed in Products details with currency "CHF"
  #  And Assert there are month categories in transactions list in Products details
  #  And Assert transaction dates are ordered correctly
    #30 transactions???

  #  Examples:
  #    | rowindex |
  #    |        4 |

  @Current_Accounts-Details-Financial_Details_[WEB]
  Scenario Outline: Current_Accounts-Details-Financial_Details_[WEB]

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

    #Below the header there are tabs: Transactions, Card settings, Statements, Details Exchange.
    #User is by default on Transactions tab.
    And Assert order of tabs in tablist
    #Below the tabs, icons for Date picker, Filter, Select category and Search filter are displayed on the left side.
    # On the right side there is a Download option.
    And Assert element by text " Download transaction list "
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"
    And Assert element by text "Search "
    And Assert element by text " Filters"
    And Click on element by text " Filters"
    And Assert date picker


    #User clicks on tab Details
    When Click on tab "Details" from tablist
    And Wait for product details to load
    #Sections are displayed in the following order:
      # Financial details, Account details, Bundle services available, Cheques, Debit cards\
    And Assert order of sections in tabpanel
    #Financial details:
    And Assert Overdraft is displayed correctly in Financial details for Current account
    And Assert Overdraft expiration date is displayed correctly in Financial details for Current accounts
    And Assert Overdraft interest rate is displayed correctly in Financial details for Current account
    And Assert Unauthorized overdraft Interest rate is displayed correctly in Financial details for Current account
    And Assert element by text " Currency exchange "


    Examples:
      | rowindex |
      | 1        |



    @Current_Accounts-Details-Account_Details_[WEB]
    Scenario Outline: Current_Accounts-Details-Account_Details_[WEB]

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

    #Below the header there are tabs: Transactions, Card settings, Statements, Details Exchange.
    #User is by default on Transactions tab.
      And Assert order of tabs in tablist
    #Below the tabs, icons for Date picker, Filter, Select category and Search filter are displayed on the left side.
    # On the right side there is a Download option.
      And Assert element by text " Download transaction list "
      And Assert element by contains class "icon-download"
      And Assert element by tag "input" and type "search"
      And Assert element by text "Search "
      And Assert element by text " Filters"
      And Click on element by text " Filters"
      And Assert date picker

    #User clicks on tab Details
      When Click on tab "Details" from tablist
      And Wait for product details to load
    #Sections are displayed in the following order:
      # Financial details, Account details, Bundle services available, Cheques, Debit cards\
      #And Assert order of sections in tabpanel

      And Assert Account type is displayed correctly in Account details for Current account
      #And Assert Account owner in Account details is from Excel "<rowindex>" columnName "personal_name"
      And Assert Account number in Account details is from Excel "<rowindex>" columnName "personal_account_number"
      And Assert BIC in Account details is "KOBBRSBG"

      And Click on element by tag "i" contains class "icon-copy"
      And Assert content in clipboard is from Excel "<rowindex>" columnName "copied_account_details_for_personal_account"
      #And Assert element by text " Document archive "
      #And Click on normalized text "Document archive"
      #And Assert element by normalized text "Documents archive is available from 1. 3. 2016. Please select your search criteria to find your documents."



      Examples:
        | rowindex |
        | 1        |


    @Current_Accounts-Header-Display_[WEB]
    Scenario Outline: Current_Accounts-Header-Display_[WEB]

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

    #HEADER DISPLAY
     # Then Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name2"
      And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_bban"
      And Assert Product icon in Product details is displayed and has icon path "https://test.dbp.nlbkb.rs/assets/img/product-icon/CurrentAccount-Icon.svg"
      And Assert available balance and current balance in header

      #click on Details tab and assert header is still displayed correctly
      When Click on tab "Details" from tablist
      And Wait for product details to load
      #Then Assert Product name in Product details is from Excel "<rowindex>" columnName "personal_account_name2"
      And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_bban"
      And Assert Product icon in Product details is displayed and has icon path "https://test.dbp.nlbkb.rs/assets/img/product-icon/CurrentAccount-Icon.svg"
      And Assert available balance and current balance in header

      Examples:
        | rowindex |
        | 1        |



    @Current_Accounts-Transactions_Details-Create_Confirmation_[WEB]
    Scenario Outline: Current_Accounts-Transactions_Details-Create_Confirmation_[WEB]

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
    # On the right side there is a Download option.
      And Assert element by text " Download transaction list "
      And Assert element by contains class "icon-download"
      And Assert element by tag "input" and type "search"
      And Assert element by text "Search "
      And Assert element by text " Filters"
      And Click on element by text " Filters"
      #And Assert date picker

      And Scroll to element by tag "nlb-selected-product-transactions-filters"
    #And Assert transactions filters are displayed correctly in Products details
      And Scroll to first transaction in Products details
      And Click on down arrow on first transaction do display details
      And Remember values from transcation details

      And Scroll element by contains text "Confirmation" into bottom view
      And Click on Get receipt button in Transaction details
      Then Assert document with name starting with "Potvrda+o+izvršenom+nalogu+za+prenos" and has file type ".pdf" is downloaded
      And Assert that transaction values in PDF match remembered values

      Examples:
        | rowindex |
        | 1        |
