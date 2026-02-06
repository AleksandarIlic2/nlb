Feature: Term_Deposits_Accounts


  #TERM_DEPOSIT_LISTS JE TRENUTNO BLOCKED, ALI TREBA GA SVAKAKO PROMENITI I DODATI PROVERU SORTIRANOSTI
#  @Term_Deposits_Lists_[WEB]
#  Scenario Outline: Term_Deposits_Lists_[WEB]
#
#    Given Open Login page
#    And Change language to English
#    And Login to the page using user from Excel "<rowindex>" columnName "username"
#    And Assert that products in my products have loaded
#
#    Then Scroll element by xPath "//div[contains(@class,'heading-5') and normalize-space()='Term deposit amount']/following::span[contains(@class,'tw-pl-1')]" into bottom view
#    And Assert amount and currency are displayed by xPaths "(//span[contains(@class,'tw-pl-1')]/preceding-sibling::span)[last()]" and "//div[contains(@class,'heading-5') and normalize-space()='Term deposit amount']/following::span[contains(@class,'tw-pl-1')]"
#    And Assert Product number is in BBAN format by xPath "//nlb-heading-text[.//div[contains(text(),'Oročeni depozit')]]/following-sibling::div"
#    And Assert Product name is displayed by xPath "(//*[contains(@class, 'heading-3')])[last()]"
#    And Assert Product card is clickable by xPath "(//*[contains(@class, 'heading-3')])[last()]"
#    And Assert user is redirected to the page by contains URL "TERM_DEPOSIT"
#
#    Examples:
#      | rowindex |
#      |        1 |


  @Term_Deposits-Accounts_Details[WEB]
  Scenario Outline: Term_Deposits-Accounts_Details[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    And Assert element by class "button-bold" containing text "Edit list"
    And Assert that element contains text from Excel "<rowindex>" columnName "term_deposits_1_account_number"
    And Click on element by containing text from Excel "<rowindex>" columnName "term_deposits_1_account_number"
    And Assert that element "Interest rate" has value "0,2000%"
    And Assert that element "Term deposit amount" has value "5.000,00 EUR"
    And Assert that element "Accrued interest" has value "0,00 EUR"
    And Assert that element "Account type" has value "Deposit"
    And Assert that element "Account owner" has value "ANOEV OSIR"
    And Assert that element "Account number" has value "9032022325800"
    And Assert that element "Opening date" has value "15.01.2016"
    And Assert that element "Expiration date" has value "15.01.2028"
    #TODO: SVE ZAKUCANE PODATKE VUCI IZ EKSELA (MOZDA)

    Examples:
      | rowindex |
      |        1 |

  @Term_Deposits-Details_Account_Details_[WEB]
  Scenario Outline: Term_Deposits-Details_Account_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Click on tab "My products" from main sidebar
    And Wait for element by text "Edit list"
    And Assert element by class "button-bold" containing text "Edit list"
    And Assert that element contains text from Excel "<rowindex>" columnName "term_deposits_1_account_number"
    And Click on element by containing text from Excel "<rowindex>" columnName "term_deposits_1_account_number"
    And Assert that element "Interest rate" has value "0,2000%"
    And Assert that element "Term deposit amount" has value "5.000,00 EUR"
    And Assert that element "Accrued interest" has value "0,00 EUR"
    And Assert that element "Account type" has value "Deposit"
    And Assert that element "Account owner" has value "ANOEV OSIR"
    And Assert that element "Account number" has value "9032022325800"
    And Assert that element "Opening date" has value "15.01.2016"
    And Assert that element "Expiration date" has value "15.01.2028"

    And Click on element by text " Document archive "  
    #TODO: Kada budu dodata dokumenta za nekog usera assertovati i dokumenta

    Examples:
      | rowindex |
      |        1 |