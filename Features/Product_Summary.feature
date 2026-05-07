Feature: Product_Summary

  @Product_Summary_Favourite_account_[WEB]
  Scenario Outline: Product_Summary_Favourite_account_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "My Products" from main sidebar
    And Wait for element by class "button-bold"
    And Assert element by class "button-bold"
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"

    Then Click on element by text "Set favorite account"
    And Wait for element by contains text "Your favorite account will be listed on top of the list."
    And Change favorite account to account from Excel "<rowindex>" columnName "current_account_1_iban"
    And Click on tab "My Products" from main sidebar
    And Assert that first product shown on my products page is from Excel "<rowindex>" columnName "current_account_1_iban"
    And Click on tab "My NLB" from main sidebar
    And Wait for element by text "Shortcuts"
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_iban" is displayed
    And Click on tab "My Products" from main sidebar
    And Wait for element by class "button-bold"
    And Assert element by class "button-bold"
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"

    And Click on element by text "Set favorite account"
    And Wait for element by contains text "Your favorite account will be listed on top of the list."
    And Click on element by xpath "(//nlb-radio-button)[1]"
    And Click on element by containing text "Apply"

  Examples:
  | rowindex |
  |        2 |

  @Product_Summary_Sorting_on_the_Product_Summary_[WEB]
  Scenario Outline: Product_Summary_Sorting_on_the_Product_Summary_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "My Products" from main sidebar
    And Wait for element by text "Edit list"

    Then Accounts are displayed in the following order:
      | Current accounts  |
      | Cards             |
      | Savings accounts  |
      | Loans             |

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Current_Accounts_List_[WEB]
  Scenario Outline: Product_Summary-Current_Accounts_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    And Wait for element by text "Edit list"

    Then Assert product details are displayed
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert order of tabs in tablist "domestic"

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Edit_Product_view-edit_name_of_account_[WEB]
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "My Products" from main sidebar
    And Wait for element by class "button-bold"
    And Assert element by class "button-bold"
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"

     #PROMENA IMENA TEKUCIH RACUNA
    And Change name of product from excel "<rowindex>" columnName "current_account_2_bban" into "First domestic current account"
    And Change name of product from excel "<rowindex>" columnName "current_account_1_iban" into "First foreign current account"

    #PROMENA IMENA KARTICA
    And Change name of product from excel "<rowindex>" columnName "credit_card_2_number" into "First credit card"
#    And Change name of product from excel "<rowindex>" columnName "credit_card_2_number" into "Second credit card"

    #PROMENA IMENA STEDNJE
    And Change name of product from excel "<rowindex>" columnName "savings_account_1_number" into "First savings account"
#    And Change name of product from excel "<rowindex>" columnName "savings_account_2_number" into "Second savings account"

    #PROMENA OROCENE STEDNJE
    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_account_number" into "First term deposits"

    #PROMENA IMENA KREDITE
    And Change name of product from excel "<rowindex>" columnName "loan_account_1_number" into "First loan account"

    #Then Change name of the first product "Foreign currency payment accounts2"
    And Click on tab "My Products" from main sidebar
    And Assert element by contains text "First domestic current account"
    And Assert element by contains text "First foreign current account"
    And Assert element by contains text "First credit card"
#    And Assert element by contains text "Second credit card"
    And Assert element by contains text "First savings account"
#    And Assert element by contains text "Second savings account"
    And Assert element by contains text "First term deposits"
    And Assert element by contains text "First loan account"
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"

    #Then Change name of the first product "Foreign currency payment accounts"
    And Change name of product from excel "<rowindex>" columnName "current_account_2_bban" to previous one
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_name" is displayed
    And Change name of product from excel "<rowindex>" columnName "current_account_1_iban" to previous one
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_name" is displayed
#    And Change name of product from excel "<rowindex>" columnName "credit_card_1_number" to previous one
    And Change name of product from excel "<rowindex>" columnName "credit_card_2_number" to previous one
#    And Wait for "10" seconds
    And Assert element by contains text from excel "<rowindex>" columnName "credit_card_2_name" is displayed
    And Change name of product from excel "<rowindex>" columnName "savings_account_1_number" to previous one
    And Assert element by contains text from excel "<rowindex>" columnName "savings_account_1_name" is displayed
#    And Change name of product from excel "<rowindex>" columnName "savings_account_2_number" to previous one
    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_account_number" to previous one
    And Assert element by contains text from excel "<rowindex>" columnName "term_deposit_1_name" is displayed
    And Change name of product from excel "<rowindex>" columnName "loan_account_1_number" to previous one
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_1_name" is displayed

    Then Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_name" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_name" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "credit_card_2_name" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "savings_account_1_name" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "term_deposit_1_name" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_1_name" is displayed

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Edit_Product_view-edit_name_of_account-Invalid_[WEB]
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "My Products" from main sidebar
    And Wait for element by class "button-bold"
    And Assert element by class "button-bold"
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"

    And Change name of product from excel "<rowindex>" columnName "current_account_2_bban" into more than fifty characters
    And Assert element by text "You have reached the maximum number of characters. 50/50."
    And Click on element by containing text "Cancel"

    And Change name of product from excel "<rowindex>" columnName "current_account_1_iban" into more than fifty characters
    And Assert element by text "You have reached the maximum number of characters. 50/50."
    And Click on element by containing text "Cancel"

    And Change name of product from excel "<rowindex>" columnName "credit_card_2_number" into more than fifty characters
    And Assert element by text "You have reached the maximum number of characters. 50/50."
    And Click on element by containing text "Cancel"

    And Change name of product from excel "<rowindex>" columnName "savings_account_1_number" into more than fifty characters
    And Assert element by text "You have reached the maximum number of characters. 50/50."
    And Click on element by containing text "Cancel"

    Then Change name of product from excel "<rowindex>" columnName "term_deposits_1_account_number" into more than fifty characters
    And Assert element by text "You have reached the maximum number of characters. 50/50."
    And Click on element by containing text "Cancel"

    And Change name of product from excel "<rowindex>" columnName "loan_account_1_number" into more than fifty characters
    And Assert element by text "You have reached the maximum number of characters. 50/50."
    And Click on element by containing text "Cancel"

    Then Change name of product from excel "<rowindex>" columnName "current_account_2_bban" into " "
    And Assert acc name for iban from excel "<rowindex>" columnName "current_account_2_bban"

    And Change name of product from excel "<rowindex>" columnName "current_account_1_iban" into " "
    And Assert acc name for iban from excel "<rowindex>" columnName "current_account_1_iban"

    And Change name of product from excel "<rowindex>" columnName "credit_card_2_number" into " "
    And Assert acc name for iban from excel "<rowindex>" columnName "credit_card_2_number"

    And Change name of product from excel "<rowindex>" columnName "savings_account_1_number" into " "
    And Assert acc name for iban from excel "<rowindex>" columnName "savings_account_1_number"

    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_account_number" into " "
    And Assert acc name for iban from excel "<rowindex>" columnName "term_deposits_1_account_number"

    And Change name of product from excel "<rowindex>" columnName "loan_account_1_number" into " "
    And Assert acc name for iban from excel "<rowindex>" columnName "loan_account_1_number"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Current_Domestic_Account
  Scenario Outline: Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Current_Domestic_Account

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Assert that products in my products have loaded
    And Assert element by class "button-bold"
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"

    And Hide product with iban from excel "<rowindex>" columnName "current_account_2_bban"

    Then Assert that products in my products have loaded
    And Assert element from excel "<rowindex>" columnName "current_account_2_bban" is not displayed
    And Click on element by text "Payments"
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Assert element from excel "<rowindex>" columnName "current_account_2_bban" is not displayed
    And Assert that products in my products have loaded
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"
    And Unhide product with iban from excel "<rowindex>" columnName "current_account_2_bban"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "current_account_2_bban" in my products page
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_2_bban" is displayed

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Saving_Accounts
  Scenario Outline: Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Saving_Accounts

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Assert that products in my products have loaded
    And Assert element by class "button-bold"
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"

    And Hide product with iban from excel "<rowindex>" columnName "savings_account_1_number"

#    And Click on tab "My products" from main sidebar
#    And Wait for element by text "Edit list"
    Then Assert that products in my products have loaded
    And Assert element from excel "<rowindex>" columnName "savings_account_1_number" is not displayed
    And Click on element by text "Payments"
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Assert element from excel "<rowindex>" columnName "savings_account_1_number" is not displayed
    And Assert that products in my products have loaded
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"
    And Unhide product with iban from excel "<rowindex>" columnName "savings_account_1_number"
    And Assert that products in my products have loaded
#    And Wait for element by text "Edit list"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "savings_account_1_number" in my products page
    And Assert element by contains text from excel "<rowindex>" columnName "savings_account_1_number" is displayed

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Term_Deposits
  Scenario Outline: Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Term_Deposits

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Assert that products in my products have loaded
    And Assert element by class "button-bold"
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"

    And Hide product with iban from excel "<rowindex>" columnName "term_deposits_1_account_number"

#    And Click on tab "My products" from main sidebar
#    And Wait for element by text "Edit list"
    Then Assert that products in my products have loaded
    And Assert element from excel "<rowindex>" columnName "term_deposits_1_account_number" is not displayed
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"
    And Unhide product with iban from excel "<rowindex>" columnName "term_deposits_1_account_number"
    And Assert that products in my products have loaded
#    And Wait for element by text "Edit list"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "term_deposits_1_account_number" in my products page
    And Assert element by contains text from excel "<rowindex>" columnName "term_deposits_1_account_number" is displayed

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Loan_Accounts
  Scenario Outline: Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Loan_Accounts

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Assert that products in my products have loaded
    And Assert element by class "button-bold"
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"

    And Hide product with iban from excel "<rowindex>" columnName "loan_account_1_number"

#    And Click on tab "My products" from main sidebar
#    And Wait for element by text "Edit list"
    Then Assert that products in my products have loaded
    And Assert element from excel "<rowindex>" columnName "loan_account_1_number" is not displayed
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"
    And Unhide product with iban from excel "<rowindex>" columnName "loan_account_1_number"
    And Assert that products in my products have loaded
#    And Wait for element by text "Edit list"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "loan_account_1_number" in my products page
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_1_number" is displayed

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Current_Foreign_Accounts
  Scenario Outline: Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Current_Foreign_Accounts

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Assert that products in my products have loaded
    And Assert element by class "button-bold"
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"

    And Hide product with iban from excel "<rowindex>" columnName "current_account_1_iban"

#    And Click on tab "My products" from main sidebar
#    And Wait for element by text "Edit list"
    Then Assert that products in my products have loaded
    And Assert element from excel "<rowindex>" columnName "current_account_1_iban" is not displayed
    And Click on element by text "Payments"
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Assert element from excel "<rowindex>" columnName "current_account_1_iban" is not displayed
    And Assert that products in my products have loaded
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"
    And Unhide product with iban from excel "<rowindex>" columnName "current_account_1_iban"
    And Assert that products in my products have loaded
#    And Wait for element by text "Edit list"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "current_account_1_iban" in my products page
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_iban" is displayed

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Credit_Cards
  Scenario Outline: Product_Summary-Hide/Show_Product_on_Product_List_[WEB]_Credit_Cards

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Assert that products in my products have loaded
    And Assert element by class "button-bold"
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"

    And Hide product with iban from excel "<rowindex>" columnName "credit_card_2_number"

#    And Click on tab "My products" from main sidebar
#    And Wait for element by text "Edit list"
    Then Assert that products in my products have loaded
    And Assert element from excel "<rowindex>" columnName "credit_card_2_number" is not displayed
    And Click on element by text "Payments"
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Assert element from excel "<rowindex>" columnName "credit_card_2_number" is not displayed
    And Assert that products in my products have loaded
    And Click on element by class "button-bold"
    And Wait for element by class "icon-eye"
    And Unhide product with iban from excel "<rowindex>" columnName "credit_card_2_number"
    And Assert that products in my products have loaded
#    And Wait for element by text "Edit list"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "credit_card_2_number" in my products page
    And Assert element by contains text from excel "<rowindex>" columnName "credit_card_2_name" is displayed

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Credit_Card_List_[WEB]
  Scenario Outline: Product_Summary-Credit_Card_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Assert element by class "button-bold"

    When Scroll to account from excel "<rowindex>" columnName "credit_card_2_number" in my products page
    And Assert Credit cards icons is displayed
    And Assert Credit cards product names is displayed
    And Assert Credit cards account numbers is displayed
    And Assert Credit cards current balances is displayed

    Then Click on element from Excel "<rowindex>" contains text columnName "credit_card_2_number"
    And Wait for first transaction in Product details
    And Assert tabs in Product details are displayed correctly for Credit Cards

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Current_Foreign_Accounts_List_[WEB]
  Scenario Outline: Product_Summary-Current_Foreign_Accounts_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Assert element by class "button-bold"

    When Scroll to account from excel "<rowindex>" columnName "current_account_1_iban" in my products page
    And Assert Current foreign accounts icons is displayed
    And Assert Current foreign accounts product names is displayed
    And Assert Current foreign accounts account numbers is displayed
    And Assert Current foreign accounts available balances is displayed
    And Assert Current foreign accounts current balances is displayed

    Then Click on element from Excel "<rowindex>" contains text columnName "current_account_1_iban"
    And Wait for first transaction in Product details
    And Assert tabs in Product details are displayed correctly for Current Foreign Accounts

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Current_Domestic_Accounts_List_[WEB]
  Scenario Outline: Product_Summary-Current_Domestic_Accounts_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Assert element by class "button-bold"

    When Scroll to account from excel "<rowindex>" columnName "current_account_1_iban" in my products page
    And Assert Current domestic accounts icons is displayed
    And Assert Current domestic accounts product names is displayed
    And Assert Current domestic accounts account numbers is displayed
    And Assert Current domestic accounts available balances is displayed
    And Assert Current domestic accounts current balances is displayed

    Then Click on element from Excel "<rowindex>" contains text columnName "current_account_2_bban"
    And Wait for first transaction in Product details
    And Assert tabs in Product details are displayed correctly for Current Domestic Accounts

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Savings_Accounts_List_[WEB]
  Scenario Outline: Product_Summary-Savings_Accounts_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Assert element by class "button-bold"

    When Scroll to account from excel "<rowindex>" columnName "savings_account_1_number" in my products page
    And Assert Saving accounts icons is displayed
    And Assert Saving accounts product names is displayed
    And Assert Saving accounts account numbers is displayed
    And Assert Saving accounts current balances is displayed

    Then Click on element from Excel "<rowindex>" contains text columnName "savings_account_1_number"
    And Wait for element by text "Transactions"

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Term_Deposits_List_[WEB]
  Scenario Outline: Product_Summary-Term_Deposits_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Assert element by class "button-bold"

    When Scroll to account from excel "<rowindex>" columnName "term_deposits_1_account_number" in my products page
    And Assert Term deposits accounts icons is displayed
    And Assert Term deposits product names is displayed
    And Assert Term deposits account numbers is displayed
    And Assert Term deposits deposit amounts is displayed

    Then Click on element from Excel "<rowindex>" contains text columnName "term_deposits_1_account_number"
    And Wait for product details to load

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Loan_List[WEB]
  Scenario Outline: Product_Summary-Loan_List[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    And Assert element by class "button-bold"

    When Scroll to account from excel "<rowindex>" columnName "loan_account_1_number" in my products page
    And Assert Loan accounts icons is displayed
    And Assert Loan accounts icons is displayed
    And Assert Loan accounts product names is displayed
    And Assert Loan accounts account numbers is displayed
    And Assert Loan accounts current loan balance is displayed

    Then Click on element from Excel "<rowindex>" contains text columnName "loan_account_1_number"
    And Wait for product details to load
    And Assert Loan account tabs is displayed correctly

    Examples:
      | rowindex |
      |        5 |