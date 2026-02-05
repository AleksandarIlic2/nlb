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

Then Hide product with iban from excel "<rowindex>" columnName "current_account_1_iban"
And Click on tab "My products" from main sidebar
And Wait for element by text "Edit list"
And Assert that products in my products have loaded
And Assert element from excel "<rowindex>" columnName "current_account_1_iban" is not displayed
And Click on element by text "Edit list"
And Wait for element by class "icon-eye"
And Unhide product with iban from excel "<rowindex>" columnName "current_account_1_iban"
And Click on tab "My products" from main sidebar
And Wait for element by text "Edit list"
And Assert that products in my products have loaded
And Scroll to account from excel "<rowindex>" columnName "current_account_1_iban" in my products page
And Assert element by contains text from excel "<rowindex>" columnName "current_account_1_iban" is displayed

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

    Then Hide product with iban from excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for "5" seconds
    Then Assert that account from "<rowindex>" with columnName "current_account_1_iban" is grayed out
    Then Hide product with iban from excel "<rowindex>" columnName "current_account_2_bban"
    And Wait for "5" seconds

    Then Assert that account from "<rowindex>" with columnName "current_account_2_bban" is grayed out
    Then Hide product with iban from excel "<rowindex>" columnName "current_account_2_iban"
    And Wait for "5" seconds
    Then Assert that account from "<rowindex>" with columnName "current_account_2_iban" is grayed out
    Then Hide product with iban from excel "<rowindex>" columnName "current_account_3_iban"

    And Assert element by contains text "At least one current account must be enabled"
    And Wait for "1" seconds
    And Unhide product with iban from excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for "1" seconds
    And Unhide product with iban from excel "<rowindex>" columnName "current_account_2_bban"
    And Wait for "1" seconds
    And Unhide product with iban from excel "<rowindex>" columnName "current_account_2_iban"


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
    And Change name of product from excel "<rowindex>" columnName "current_account_2_bban" into "First current account"
    And Assert element by text "First current account" index "2" is displayed
    And Change name of product from excel "<rowindex>" columnName "current_account_2_bban" to previous one
    #PROMENA IMENA KARTICA
    And Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" into "First credit card"
    And Assert element by text "First credit card" index "2" is displayed
    And Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" to previous one

    #PROMENA IMENA STEDNJE
    And Change name of product from excel "<rowindex>" columnName "savings_account_1_number" into "First savings account"
    And Assert element by text "First savings account" index "2" is displayed
    And Change name of product from excel "<rowindex>" columnName "savings_account_1_number" to previous one
    #PROMENA OROCENE STEDNJE
    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_account_number" into "First term deposits"
    And Assert element by text "First term deposits" index "2" is displayed
    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_account_number" to previous one


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

    Then Change name of product from excel "<rowindex>" columnName "current_account_1_iban" into more than fifty characters
    Then Assert element by text "You have reached the maximum number of characters. 50/50."
    And Click on element by text " Cancel "

    Then Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" into more than fifty characters
    Then Assert element by text "You have reached the maximum number of characters. 50/50."
    And Click on element by text " Cancel "

    Then Change name of product from excel "<rowindex>" columnName "savings_account_1_number" into more than fifty characters
    Then Assert element by text "You have reached the maximum number of characters. 50/50."
    And Click on element by text " Cancel "

    Then Change name of product from excel "<rowindex>" columnName "term_deposits_1_account_number" into more than fifty characters
    Then Assert element by text "You have reached the maximum number of characters. 50/50."
    And Click on element by text " Cancel "

    Then Change name of product from excel "<rowindex>" columnName "current_account_1_iban" into " "
  #And Assert acc name for iban from excel "<rowindex>" columnName "current_account_1_bban"

    Then Change name of product from excel "<rowindex>" columnName "credit_card_1_bban" into " "
    And Assert acc name for iban from excel "<rowindex>" columnName "credit_card_1_bban"

    Then Change name of product from excel "<rowindex>" columnName "savings_account_1_number" into " "
    And Assert acc name for iban from excel "<rowindex>" columnName "savings_account_1_number"

    Then Change name of product from excel "<rowindex>" columnName "term_deposits_1_account_number" into " "
    And Assert acc name for iban from excel "<rowindex>" columnName "term_deposits_1_account_number"

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
    And Change name of product from excel "<rowindex>" columnName "savings_account_1_number" into "First savings account"
    And Change name of product from excel "<rowindex>" columnName "savings_account_2_number" into "Second savings account"

    #PROMENA OROCENE STEDNJE
    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_account_number" into "First term deposits"
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
    And Change name of product from excel "<rowindex>" columnName "savings_account_1_number" to previous one
    And Change name of product from excel "<rowindex>" columnName "savings_account_2_number" to previous one
    And Change name of product from excel "<rowindex>" columnName "term_deposits_1_account_number" to previous one
    #TODO: Dodati korak za payments
    Examples:
      | rowindex |
      |        1 |

  @Manage_Products-Favorite_account_[WEB]
  Scenario Outline: Manage_Products-Favorite_account_[WEB]
    #TODO: Podignut BUG za prikazivanje bbanova/ibnaova, sacekati da se resi..
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
    And Click Radio Button with index "favorite_acc" from excel "<rowindex>" column "current_account_3_iban"
    #User clicks on Apply button
    And Click on element by text " Apply "
    And Wait for element by text "Success"
    And Assert element by text "Success"
    #Assert first element
    And Assert for first element in product screen

    #TO DO - autorizovani account
    Examples:
      | rowindex |
      | 1        |



  @Manage_Products-Favorite_account-Removal_of_the_favorite_account_[WEB]
  Scenario Outline: Manage_Products-Favorite_account-Removal_of_the_favorite_account_[WEB]
     #TODO: Podignut BUG za prikazivanje bbanova/ibnaova, sacekati da se resi..
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
    #User choose Default sorting
    And Click Radio Button Default
    #User clicks on Apply button
    And Click on element by text " Apply "
    And Wait for element by text "Success"
    And Assert element by text "Success"
    #Assert first element
    And Assert for first element in product screen default from excel "<rowindex>" column "default_account_bban"

    Examples:
      | rowindex |
      | 1        |