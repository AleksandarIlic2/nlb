Feature: Upcoming_Payments

  @Payments-Upcoming_Payments-List_Of_Transactions_[WEB]
  Scenario Outline: Payments-Upcoming_Payments-List_Of_Transactions_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for "2" seconds
    And Wait for element by contains text "Upcoming payments"
    And Click on element by containing text "Upcoming payments"
    And Assert payments in past payments have loaded

#    Then Assert icons for Upcoming payments are displayed
    And Assert dates of Payments archive are displayed correctly
    And Assert list of elements by xPath "//h5" are displayed
    And Assert list of creditor names of Payments archive are displayed
    And Assert list of amounts with currencies of Upcoming payments are displayed correctly
    
    Then Click on element by xpath "//nlb-account-selector"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Assert dates of Payments archive are displayed correctly
    And Assert list of elements by xPath "//h5" are displayed
    And Assert list of creditor names of Payments archive are displayed
    And Assert list of amounts with currencies of Upcoming payments are displayed correctly

    Examples:
      | rowindex |
      |        2 |


    #AUTOMATIZUJ TEST DO KRAJA KADA PRORADE PLACANJA NA WEBU
  @Payments-Upcoming_Payments-Cancel_Payments_[WEB]
  Scenario Outline: Payments-Upcoming_Payments-Cancel_Payments_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for "2" seconds
    And Wait for element by contains text "Upcoming payments"
    And Click on element by containing text "Upcoming payments"
    And Assert payments in past payments have loaded
    And Click on element by text "Payments"
    And Click on element by text "Domestic payment"

    And Enter text "205-9001010537788-94" in "Account number" input field and remember under key "accountNumberKey"
    And Enter text "Enil" in "Name" input field and remember under key "nameKey"
    And Enter text "Kaludjerica" in "street" input field and remember under key "streetKey"
    And Enter text "Beograd" in "City" input field and remember under key "cityKey"
    And Assert checkbox "Save recipient" is checked "false"
    And Enter text "6" in "Payment amount" input field and remember under key "paymentAmountKey"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "keyPurpose"
    And Assert element by contains text "Urgent payment"
    And Assert checkbox "Urgent payment" is checked "true"
    And Click on calendar icon with index "1"
    And Click on date 7 days in the future in second payment screen
    And Assert checkbox "Urgent payment" is checked "false"
    And Click on button with type "submit"
    And Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "paymentAmountKey" is displayed
    And Assert element by text "Debtor name" has following sibling "dd" with contains text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Debtor account" has following sibling "dd" with contains text from Excel "<rowindex>" columnName "current_account_2_bban"
    And Assert element by text "Name" has first following sibling under key "nameKey"
    And Assert element by text "Account number" has first following sibling under key "accountNumberKey"
    And Assert element by text "Purpose" has first following sibling under key "keyPurpose"
    And Assert date 7 days in future in payment review
    And Click on button with type "submit"
    And Wait for "10" seconds

    Examples:
      | rowindex |
      |        2 |