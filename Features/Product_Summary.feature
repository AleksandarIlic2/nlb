Feature: Product_Summary

  @Product_Summary_Favourite_account_[WEB]
  Scenario Outline: Product_Summary_Favourite_account_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    When Wait for element by text "Pay or transfer"

    #User is logged into aplication and clicks on the My Products page frome the menu
    When Click on tab "My products" from main sidebar
    #User is looking at the page
    And Wait for element by text "Edit list"
    Then Assert element by class "button-bold" and contains text "Edit list"
    #User clicks on button for Edit product view
    And Click on element by text "Edit list"
    And Wait for element by class "icon-eye"
    #User clicks on option Set favorite account
    And Click on element by text "Set favorite account"
    And Wait for element by text " Apply "
    Then Assert element by class "tw-items-center" and contains text "Apply"
    #User choose account

    #And click Radio Button By Account "205-9031004417882-84"
    And Click Radio Button with index "favorite_acc"
    #User clicks on Apply button
    And Click on element by text " Apply "
    And Wait for element by text "Success"
    And Assert element by text "Success"
    #Assert first element
    And Assert for first element in product screen
    #And Assert for first element in product screen "205-9031004417882-84"

  Examples:
  | rowindex |
  |        1 |

  @Product_Summary_Sorting_on_the_Product_Summary_[WEB]
  Scenario Outline: Product_Summary_Sorting_on_the_Product_Summary_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded
    #User clicks on the My Products page from the menu
    When Click on tab "My products" from main sidebar
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
    #User clicks on the My Products page from the menu
    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"

    Then Accounts are displayed in the following order:
      | Current accounts  |
      | Cards             |
      | Savings accounts  |
      | Term deposit      |
      | Loans             |

    #TO DO - Sorted by Owned accounts first (sorted by Opening Date ascending), followed by Authorized accounts (grouped by owner name and sorted ascending alphabetically, inside one owner by opening date ascending)
    And Assert product details are displayed

    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert order of tabs in tablist

    Examples:
      | rowindex |
      |        1 |

  @Product_Summary-Edit_Product_view-edit_name_of_account_[WEB]_1
  Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account_[WEB]_1

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    And Assert element by class "button-bold" containing text "Edit list"
    And Click on element by text "Edit list"
    And Wait for element by class "icon-eye"

     #PROMENA IMENA TEKUCIH RACUNA
    And Change name of product from excel "<rowindex>" columnName "current_account_3_iban" into "First current account"
    And Change name of product from excel "<rowindex>" columnName "current_account_1_iban" into "Second current account"

    #PROMENA IMENA KARTICA
    And Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" into "First credit card"
    And Change name of product from excel "<rowindex>" columnName "credit_card_2_bban" into "Second credit card"

    #PROMENA IMENA STEDNJE
    And Change name of product from excel "<rowindex>" columnName "savings_account_1_bban" into "First savings account"
    And Change name of product from excel "<rowindex>" columnName "savings_account_2_bban" into "Second savings account"

    #PROMENA OROCENE STEDNJE
    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_bban" into "First term deposits"
    #Then Change name of the first product "Foreign currency payment accounts2"
    And Click on tab "My products" from main sidebar
    And Assert element by contains text "First current account"
    And Assert element by contains text "Second current account"
    And Assert element by contains text "First credit card"
    And Assert element by contains text "Second credit card"
    And Assert element by contains text "First savings account"
    And Assert element by contains text "Second savings account"
    And Assert element by contains text "First term deposits"
    And Click on element by text "Edit list"
    And Wait for element by class "icon-eye"

    #Then Change name of the first product "Foreign currency payment accounts"
    And Change name of product from excel "<rowindex>" columnName "current_account_3_iban" to previous one
    And Change name of product from excel "<rowindex>" columnName "current_account_1_iban" to previous one
    And Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" to previous one
    And Change name of product from excel "<rowindex>" columnName "credit_card_2_bban" to previous one
    And Change name of product from excel "<rowindex>" columnName "savings_account_1_bban" to previous one
    And Change name of product from excel "<rowindex>" columnName "savings_account_2_bban" to previous one
    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_bban" to previous one
    Examples:
      | rowindex |
      |        1 |

@Product_Summary-Edit_Product_view-edit_name_of_account-Invalid_[WEB]_1
Scenario Outline: Product_Summary-Edit_Product_view-edit_name_of_account-Invalid_[WEB]_1

  Given Open Login page
  And Change language to English
  And Login to the page using user from Excel "<rowindex>" columnName "username"
  And Wait for element by text "Pay or transfer"

  When Click on tab "My products" from main sidebar
  And Wait for element by text "Edit list"
  And Assert element by class "button-bold" containing text "Edit list"
  And Click on element by text "Edit list"
  And Wait for element by class "icon-eye"

  Then Change name of product from excel "<rowindex>" columnName "current_account_1_bban" into more than fifty characters
  Then Assert element by text "You have reached the maximum number of characters. 50/50."
  And Click on element by text " Cancel "

  Then Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" into more than fifty characters
  Then Assert element by text "You have reached the maximum number of characters. 50/50."
  And Click on element by text " Cancel "

  Then Change name of product from excel "<rowindex>" columnName "savings_account_1_bban" into more than fifty characters
  Then Assert element by text "You have reached the maximum number of characters. 50/50."
  And Click on element by text " Cancel "

  Then Change name of product from excel "<rowindex>" columnName "term_deposits_1_bban" into more than fifty characters
  Then Assert element by text "You have reached the maximum number of characters. 50/50."
  And Click on element by text " Cancel "

  Then Change name of product from excel "<rowindex>" columnName "current_account_1_bban" into " "
  #And Assert acc name for iban from excel "<rowindex>" columnName "current_account_1_bban"

  Then Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" into " "
  And Assert acc name for iban from excel "<rowindex>" columnName "credit_card_1_bban"

  Then Change name of product from excel "<rowindex>" columnName "savings_account_1_bban" into " "
  And Assert acc name for iban from excel "<rowindex>" columnName "savings_account_1_bban"

  Then Change name of product from excel "<rowindex>" columnName "term_deposits_1_bban" into " "
  And Assert acc name for iban from excel "<rowindex>" columnName "term_deposits_1_bban"

  Examples:
    | rowindex |
    |        1 |


  @Product_Summary-Hide/Show_account_on_Product_List_[WEB]_1
  Scenario Outline: Product_Summary-Hide/Show_account_on_Product_List_[WEB]_1

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    And Assert element by class "button-bold" containing text "Edit list"
    And Click on element by text "Edit list"
    And Wait for element by class "icon-eye"

    Then Hide product with iban from excel "<rowindex>" columnName "current_account_1_bban"
    And Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    And Assert that products in my products have loaded
    And Assert element from excel "<rowindex>" columnName "current_account_1_bban" is not displayed
    And Click on element by text "Edit list"
    And Wait for element by class "icon-eye"
    And Unhide product with iban from excel "<rowindex>" columnName "current_account_1_bban"
    And Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "current_account_1_bban" in my products page
    And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_bban" is displayed

    Examples:
      | rowindex |
      |        1 |


  @Product_Summary-Credit_Card_List_[WEB]_1
  Scenario Outline: Product_Summary-Credit_Card_List_[WEB]_1

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    And Assert element by class "button-bold" containing text "Edit list"

    And Click on element by text "Edit list"
    And Wait for element by class "icon-eye"
    Then Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" into "First credit card"
    When Click on tab "My products" from main sidebar
    And Assert element by contains text "First credit card"
    And Click on element by text "Edit list"
    And Wait for element by class "icon-eye"
    And Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" to previous one
    When Click on tab "My products" from main sidebar
    #TODO: U koraku ispod otkomentarisati par stvari kada budu sredjene
    And Check order and display format of all cards
    And Assert that whole product card of credit card account with name "credit_card_1_name" and iban "credit_card_1_bban" from Excel "<rowindex>" acts as a clickable button
    #TODO: Available balance - Credit cards has available balance in EUR and RSD
    #TODO: Kada budu dodate autorizovane kartice dodati i njih

    Examples:
      | rowindex |
      |        1 |

