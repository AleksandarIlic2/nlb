Feature: Manage_Products

@Manage_Products-Hide/Show_account_on_Product_List_[WEB]_1
Scenario Outline: Manage_Products-Hide/Show_account_on_Product_List_[WEB]_1

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

  @Manage_Products-Hide/Show_account_on_Product_List_Invalid[WEB]_1
  Scenario Outline: Manage_Products-Hide/Show_account_on_Product_List_Invalid[WEB]_1

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
    And Wait for "1" seconds
    Then Assert that account from "<rowindex>" with columnName "current_account_1_bban" is grayed out
    Then Hide product with iban from excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for "1" seconds
    Then Assert that account from "<rowindex>" with columnName "current_account_1_bban" is grayed out
    Then Hide product with iban from excel "<rowindex>" columnName "current_account_1_bban"

    And Assert element by contains text "At least one current account must be enabled"
    And Wait for "1" seconds
    And Unhide product with iban from excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for "1" seconds
    And Unhide product with iban from excel "<rowindex>" columnName "current_account_1_bban"


    Examples:
      | rowindex |
      |        1 |



  @Manage_Products-Nickname_Product_Returning_To_Default_Name_[WEB]
  Scenario Outline: Manage_Products-Nickname_Product_Returning_To_Default_Name_[WEB]

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
    And Change name of product from excel "<rowindex>" columnName "current_account_3_bban" into "First current account"
    And Assert element by text "First current account" index "2" is displayed
    And Change name of product from excel "<rowindex>" columnName "current_account_3_bban" to previous one
    #PROMENA IMENA KARTICA
    And Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" into "First credit card"
    And Assert element by text "First credit card" index "2" is displayed
    And Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" to previous one

    #PROMENA IMENA STEDNJE
    And Change name of product from excel "<rowindex>" columnName "savings_account_1_bban" into "First savings account"
    And Assert element by text "First savings account" index "2" is displayed
    And Change name of product from excel "<rowindex>" columnName "savings_account_1_bban" to previous one
    #PROMENA OROCENE STEDNJE
    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_bban" into "First term deposits"
    And Assert element by text "First term deposits" index "2" is displayed
    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_bban" to previous one


    Examples:
      | rowindex |
      |        1 |

  @Manage_Products-Nickname_Product_[WEB]_Invalid
  Scenario Outline: Manage_Products-Nickname_Product_[WEB]_Invalid

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

  @Manage_Products-Nickname_Product_[WEB]
  Scenario Outline: Manage_Products-Nickname_Product_[WEB]

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
    And Change name of product from excel "<rowindex>" columnName "current_account_3_bban" into "First current account"
    And Change name of product from excel "<rowindex>" columnName "current_account_1_bban" into "Second current account"

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
    And Change name of product from excel "<rowindex>" columnName "current_account_3_bban" to previous one
    And Change name of product from excel "<rowindex>" columnName "current_account_1_bban" to previous one
    And Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" to previous one
    And Change name of product from excel "<rowindex>" columnName "credit_card_2_bban" to previous one
    And Change name of product from excel "<rowindex>" columnName "savings_account_1_bban" to previous one
    And Change name of product from excel "<rowindex>" columnName "savings_account_2_bban" to previous one
    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_bban" to previous one

    Examples:
      | rowindex |
      |        1 |
