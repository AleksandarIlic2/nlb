Feature: Current_Accounts

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

      And Assert Product name in Product details is from Excel "<rowindex>" columnName "current_account_1_name"
      And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "current_account_1_bban"
    #Below the header there are tabs: Transactions, Card settings, Statements, Details Exchange.
    #User is by default on Transactions tab.
      And Assert order of tabs in tablist "domestic"
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
        | 5        |


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
