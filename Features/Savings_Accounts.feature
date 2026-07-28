Feature: Saving_Accounts

  @Savings_Accounts_Details-Financial_Details_[WEB]
  Scenario Outline: Savings_Accounts_Details-Financial_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Assert element by contains text "Transactions"
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert Transactions tab is selected by default
    And Assert element by contains text "Download"
    And Assert element by xPath "//*[contains(@class, 'wrap tw-items')]" is displayed
    And Assert element by text " Filters" is displayed

    Then Click on element by text "Details"
#    TO DO sledeca metoda:
#    And Assert sections are displayed in order:
#      | Financial details |
#      | Account details   |

    And Wait for element by xPath "//h3[contains(@class, 'bold heading-3')]"
    And Assert element by contains text "Financial details" is not displayed

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts_Details-Account_Details_[WEB]
  Scenario Outline: Savings_Accounts_Details-Account_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Assert element by contains text "Transactions"
    And Assert element by contains text "Statements"
    And Assert element by contains text "Details"
    And Assert Transactions tab is selected by default
    And Assert element by contains text "Download"
    And Assert element by xPath "//*[contains(@class, 'wrap tw-items')]" is displayed
    And Assert element by text " Filters" is displayed

    Then Click on element by text "Details"
#    TO DO sledeca metoda:
#    And Assert sections are displayed in order:
#      | Financial details |
#      | Account details   |

    And Wait for product details to load
    And Assert Account type is displayed correctly in Account details for Savings account
#    And Assert contains text under key "fullNameKey" is displayed
    And Assert Account number in Savings Account details is from Excel "<rowindex>" columnName "savings_account_1_number"
    And Assert Purpose is displayed correctly in Account details for Savings account
    And Assert Opening date is displayed correctly in Account details for Savings account
#    And Assert element by text " Document archive " is displayed
#    And Click on element by text " Document archive "
#    And Wait for element by text "Documents_DocumentsArchive_Description"
#    And Assert element by text "Documents_DocumentsArchive_Description" is displayed

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts-Statements-Download_[WEB]
  Scenario Outline: Savings_Accounts-Statements-Download_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load

    When Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "savings_account_1_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "savings_account_1_number"
    And Assert tabs in Product details are displayed correctly for Savings Accounts
    And Select "Statements" tab in Products details
    And Assert "Statements" tab in Products details is selected
    And Scroll to element by xPath "//a[contains(text(), 'Transactions')]" and scroll 1 more screen
    And Wait for element by tag "nlb-selected-product-statements"
    And Assert either element with xPath "//nlb-selected-product-statements//nlb-empty-list//div[text() = 'There are no statements for the selected year.']/preceding-sibling::div/img[@alt='Empty list']" or element with xpath "(//nlb-statement-item)[1]" is displayed
    And Assert Statements filter label is "Filter by year"
    And Assert Statements filter has year "2026" selected
    And Select year "2026" in Statements filter and assert there are 11 options
    And Assert first statement in Statement list
    And Click download on first statement in Statement list

    Then Assert document with name starting with "Izvod_" and has file type ".pdf" is downloaded
    And Delete last downloaded file

    Examples:
      | rowindex |
      |        4 |


  @Savings_Accounts-Statements-Empty_State_[WEB]
  Scenario Outline: Savings_Accounts-Statements-Empty_State_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load

    When Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "savings_account_1_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "savings_account_1_number"
    And Select "Statements" tab in Products details
    And Assert "Statements" tab in Products details is selected
    And Scroll to element by xPath "//a[contains(text(), 'Transactions')]" and scroll 1 more screen
    And Wait for element by tag "nlb-selected-product-statements"
    And Assert either element with xPath "//nlb-selected-product-statements//nlb-empty-list//div[text() = 'There are no statements for the selected year.']/preceding-sibling::div/img[@alt='Empty list']" or element with xpath "(//nlb-statement-item)[1]" is displayed
    And Assert Statements filter label is "Filter by year"
    And Assert Statements filter has year "2026" selected
    And Select year "2018" in Statements filter and assert there are 11 options

    Then Assert element by normalized text "There are no statements for the selected year."

    Examples:
      | rowindex |
      |        4 |


  @Savings_Accounts-Transactions_Details_[WEB]
  Scenario Outline: Savings_Accounts-Transactions_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Assert element by class "button-bold" and contains text "Edit list"
    And Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "savings_account_1_name"

    And Assert Transactions tab is selected by default
    And Wait for first transaction in Product details
    And Click on down arrow on first transaction do display details
    And Assert element by text "Account number" has following sibling "dd" with one of two regex "^205-900100\\d{7}-\\d{2}$" and "^901100\\d{7}$"
    And Assert element by text "Amount" has following sibling "dd" with regex "^\d{1,3}(\.\d{3})*,\d{2}\s*RSD$"
    And Assert element by text "Description" has following sibling "dd" with regex "^.*$"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^0999[A-Za-z][A-Za-z0-9]{9}$"
#    And Assert element by tag "span" containing text "Send message"
    And Assert element by tag "div" containing text "Confirmation" is not displayed

    Then Click on down arrow on first transaction do display details
    And Assert element by class "tw-text-incomingColor" and index "1"

    Examples:
      | rowindex |
      |        1 |


  @Savings_accounts-Transactions_List_[WEB]
  Scenario Outline: Savings_accounts-Transactions_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Scroll to Product card with IBAN from Excel "<rowindex>" columnName "savings_account_1_number"
    And Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Wait for element by tag "nlb-product-detail-header"

    And Assert Product name in Product details is from Excel "<rowindex>" columnName "savings_account_1_name"
    And Assert Product IBAN in Product details is from Excel "<rowindex>" columnName "savings_account_1_number"
    And Wait for first transaction in Product details
    And Scroll to first transaction in Products details
    And Assert transaction is displayed correctly in Products details
    And Assert amount for month category is displayed in Products details with currency "RSD"
#    And Assert there are 30 transactions loaded in Products details
#    And Scroll screen "3" down
#    And Wait for "3" seconds
#    And Assert there are more than 30 transactions loaded in Products details
    And Assert transaction dates are ordered correctly
    And Scroll element by contains text "Transactions" up
    And Click on element by attribute "name" and value "icon-chevron-down"
    And Click on element by containing text "Last month"
    And Click on NLB button "Confirm"

    Then Wait for first transaction in Product details
    And Scroll till the end of transactions
    And Calculate the sum of all transactions under key "sum"
    And Scroll element by contains text "Transactions" up
    And Click on element by containing text "Clear filters"
    And Wait for first transaction in Product details
    And Assert amount sum for current month has value from key "sum"

    Examples:
      | rowindex |
      |        1 |


  @Saving_Accounts_Transactions_Download_Option_[WEB]
  Scenario Outline: Saving_Accounts_Transactions_Download_Option_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Assert element by class "button-bold"

    When Click on element by containing text from Excel "<rowindex>" columnName "savings_account_2_number"
    And Wait for element by tag "nlb-product-detail-header"
    And Wait for "4" seconds

    And Assert element by contains text from excel "<rowindex>" columnName "savings_account_2_number" is displayed
    And Assert element by normalized text "Download transaction list"
    And Assert element by contains class "icon-download"
    And Assert element by tag "input" and type "search"

    And Assert element with attribute "placeholder" contains value "Search..." is displayed
    And Assert element by normalized text "Filters"
    And Click on normalized text "Filters"

    And Select transaction type "Incoming transactions" in Advanced filters
    And Click on NLB button "Confirm"
    And Wait for first transaction in Product details
    And Assert there are only Incoming transactions in transactions list

    Then Remember transactions "Incoming transactions"
    And Click on normalized text "Download transaction list"
    And Assert Download transactions options are "Products_Common_Transactions_Download_Excel_Action" and "Products_Common_Transactions_Download_CSV_Action"
    And Scroll element by contains text "Products_Common_Transactions_Download_CSV_Action" into bottom view
    And Click on element by containing text "Products_Common_Transactions_Download_Excel_Action"
    And Assert document with name "Transactions.xlsx" is downloaded
    And Assert xlsx values are correct

    And Click on normalized text "Download transaction list"
    And Assert Download transactions options are "Products_Common_Transactions_Download_Excel_Action" and "Products_Common_Transactions_Download_CSV_Action"
    And Click on element by containing text "Products_Common_Transactions_Download_CSV_Action"
    And Assert document with name "Transactions.csv" is downloaded
    And Assert csv values are correct

    Examples:
      | rowindex |
      |        1 |


  @Savings_Accounts_Transactions_Filter_By_Date_Date_Picker_[WEB]
  Scenario Outline: Savings_Accounts_Transactions_Filter_By_Date_Date_Picker_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on element by containing text from Excel "<rowindex>" columnName "savings_account_2_number"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "savings_account_2_number"
    And Assert element by contains text "Transactions"
    And Click on element by containing text "Filters"

    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"

    And Click on button with tag "i" containing class "icon-calendar-today"
    And Assert window behind Date filter popup is blurred
    And Assert Select date title in Date filter
    And Select date in From label to be "30.03.2026"
    And Select date in To label to be "05.04.2026"
    And Click on element by containing text "Confirm"
    And Scroll element by contains text "end of the list" into view

    Then Assert transaction dates are between "30.03.2026" and "05.04.2026"
    And Scroll element by contains text "Clear filters" into view
    And Click on element by containing text "Clear filters"

    Examples:
      | rowindex |
      |        1 |


  @Saving_Accounts_Accounts_Statemants_List_[WEB]
  Scenario Outline: Saving_Accounts_Accounts_Statemants_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert transactions in my product have loaded

    When Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Wait for element by tag "nlb-product-detail-header"
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "savings_account_1_name"
    And Assert Product BBAN in Product details is from Excel "<rowindex>" columnName "savings_account_1_number"
    And Assert tabs in Product details are displayed correctly for Savings Accounts
    And Select "Statements" tab in Products details
    And Assert "Statements" tab in Products details is selected
    And Scroll to element by xPath "//a[contains(text(), 'Transactions')]" and scroll 1 more screen
    And Wait for element by contains text "year"
    And Assert either element with xPath "//nlb-selected-product-statements//nlb-empty-list//div[text() = 'There are no statements for the selected year.']/preceding-sibling::div/img[@alt='Empty list']" or element with xpath "(//nlb-statement-item)[1]" is displayed
    And Assert Statements filter label is "Filter by year"
    And Assert Statements filter has current year selected
    And Select year "2021" in Statements filter and assert there are 11 options
    And Remember number of Statemants in Statemants list under key "keyNumberOfTemplates"
    And Assert all dates in statements list is for year "2021" and they are sorted properly
    And Assert elements by attribute "class" contains value "subheadline medium" is displayed in amount from key "keyNumberOfTemplates"
    And Assert elements by attribute "class" contains value "nlb-icon icon-statement" is displayed in amount from key "keyNumberOfTemplates"
    And Assert elements by attribute "class" contains value "nlb-icon icon-download" is displayed in amount from key "keyNumberOfTemplates"

    Then Click download on first statement in Statement list
    And Assert document with name starting with "Izvod_" and has file type ".pdf" is downloaded

    Examples:
      | rowindex |
      |        1 |
