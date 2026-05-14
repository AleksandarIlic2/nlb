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
    And Assert element by text " Document archive " is displayed
    And Click on element by text " Document archive "
    And Wait for element by text "Documents_DocumentsArchive_Description"
    And Assert element by text "Documents_DocumentsArchive_Description" is displayed

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
    And Assert tabs in Product details are displayed correctly for Current Foreign Accounts
    And Select "Statements" tab in Products details
    And Assert "Statements" tab in Products details is selected
    And Scroll to element by xPath "//a[contains(text(), 'Transactions')]" and scroll 1 more screen
    And Wait for element by tag "nlb-selected-product-statements"
    And Assert either element with xPath "//nlb-selected-product-statements//nlb-empty-list//div[text() = 'There are no statements for the selected year.']/preceding-sibling::div/img[@alt='empty list']" or element with xpath "(//nlb-statement-item)[1]" is displayed
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