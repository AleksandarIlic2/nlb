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


    @Products_Current_Accounts-Cheques_[WEB]
    Scenario Outline: Products_Current_Accounts-Cheques_[WEB]

      Given Open Login page
      And Change language to English
      And Login to the page using user from Excel "<rowindex>" columnName "username"
      And Assert that products in my products have loaded

      When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
      And Click on element by text "Cheques"
      And Scroll element by contains text "end of the list" into view
#      And Assert all cheques from last year
      And Assert cheques are sorted by issue date descending
      And Assert element by xPath "//span[normalize-space()='Cheque number']/following-sibling::span[1]" is displayed
      And Assert element by xPath "//span[normalize-space()='Issue date']/following-sibling::span[1]" is displayed
      And Assert element by xPath "//span[normalize-space()='Status']/following-sibling::span[1]" is displayed
      And Assert element by xPath "//span[normalize-space()='Realization date']/following-sibling::span[1]" is displayed
      And Assert element by xPath "//span[normalize-space()='Amount']/following-sibling::span[1]" is displayed
      And Assert element by xPath "//span[normalize-space()='Description']/following-sibling::span[1]" is displayed
      And Assert element by text " Edit " is displayed
      
      Then Scroll element by xPath "(//*[contains(@class, 't-gray-900 tw-border')])[1]" into bottom view
      And Click on element by xpath "(//*[text()=' Edit '])[1]"
      And Click on button with tag "i" containing class "icon-calendar-today"
      And Select date in Realization date label to be "17.12.2025"
      And Enter text "5000" in field by xPath "//nlb-input-amount-currency/div/div/input"
      And Enter text "Kupovina" in field by xPath "(//nlb-input-text/div/div/div/div/input)[2]"
      And Click on element by text " Update "

    Examples:
      | rowindex |
      |        5 |


  @Products_Current_Accounts-Cheques-Filter_[WEB]
  Scenario Outline: Products_Current_Accounts-Cheques-Filter_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Click on element by text "Cheques"
    And Scroll element by contains text "end of the list" into view
#      And Assert all cheques from last year
    And Assert cheques are sorted by issue date descending
    And Assert element by xPath "//span[normalize-space()='Cheque number']/following-sibling::span[1]" is displayed
    And Assert element by xPath "//span[normalize-space()='Issue date']/following-sibling::span[1]" is displayed
    And Assert element by xPath "//span[normalize-space()='Status']/following-sibling::span[1]" is displayed
    And Assert element by xPath "//span[normalize-space()='Realization date']/following-sibling::span[1]" is displayed
    And Assert element by xPath "//span[normalize-space()='Amount']/following-sibling::span[1]" is displayed
    And Assert element by xPath "//span[normalize-space()='Description']/following-sibling::span[1]" is displayed
    And Assert element by text " Edit " is displayed

    Then Click on element by xpath "//*[contains(@class, 'icon-chevron')]"
    And Click on element by text " Realized "
    And Assert all cheques have status "Realized"

    And Click on element by xpath "//*[contains(@class, 'icon-chevron')]"
    And Click on element by text " Unrealized "
    And Assert all cheques have status "Unrealized"

    And Click on element by xpath "//*[contains(@class, 'icon-chevron')]"
    And Click on element by text " Cancelled "
    And Assert all cheques have status "Cancelled"
    

    Examples:
      | rowindex |
      |        5 |


  @Products_Current_Accounts-Cheques-Input_Fields-invalid_[WEB]
  Scenario Outline: Products_Current_Accounts-Cheques-Input_Fields-invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Click on element by text "Cheques"
    And Scroll element by contains text "end of the list" into view
#      And Assert all cheques from last year
    And Assert cheques are sorted by issue date descending
    And Assert element by xPath "//span[normalize-space()='Cheque number']/following-sibling::span[1]" is displayed
    And Assert element by xPath "//span[normalize-space()='Issue date']/following-sibling::span[1]" is displayed
    And Assert element by xPath "//span[normalize-space()='Status']/following-sibling::span[1]" is displayed
    And Assert element by xPath "//span[normalize-space()='Realization date']/following-sibling::span[1]" is displayed
    And Assert element by xPath "//span[normalize-space()='Amount']/following-sibling::span[1]" is displayed
    And Assert element by xPath "//span[normalize-space()='Description']/following-sibling::span[1]" is displayed
    And Assert element by text " Edit " is displayed

    Then Scroll element by xPath "(//*[contains(@class, 't-gray-900 tw-border')])[1]" into bottom view
    And Click on element by xpath "(//*[text()=' Edit '])[1]"
    And Enter text "25.25.25" in field by xPath "(//input[contains(@id, 'text-input')])[1]"
    And Click on element by text " Update "
    And Assert element by text "Field must be a date." is displayed

    #TO DO: Provera unetog datuma koji je stariji od datuma izdavanja (ili danasnjeg datuma, ne razumem kog)

    And Enter text "5000" in field by xPath "//nlb-input-amount-currency/div/div/input"

    And Enter text "Lorem ipsum dolor sit" in field by xPath "(//input[contains(@id, 'text-input')])[2]"
    And Assert element by contains text "maximum number" is displayed

    #TO DO: Specijalni karakteri u Description-u. Prihvata smajlije

    Examples:
      | rowindex |
      |        5 |
