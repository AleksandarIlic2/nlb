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
      |        5 |


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
#    And Assert element by text "Debtor name" has following sibling "dd" with contains text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert element by text "Debtor account" has following sibling "dd" with contains text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by text "Name" has first following sibling under key "nameKey"
    And Assert element by text "Account number" has first following sibling under key "accountNumberKey"
    And Assert element by text "Purpose" has first following sibling under key "keyPurpose"
    And Assert date 7 days in future in payment review
    And Click on button with type "submit"
    And Wait for element by contains text "Success"
    
    Then Click on element by containing text "Upcoming payments"
    And Wait for first past payment
    And Wait for "2" seconds
    And Scroll till you find element under key "keyPurpose" from txt file and click
    And Assert that payment under key "keyPurpose" from txt file has date 7 days in future
    And Assert that transaction "Payment status" in opened past payment is "Pending"
    And Click on element by tag "span" and contains text "Cancel payment"
    And Wait for element by text "Do you wish to cancel?"
    And Assert element by contains text "Are you really sure to cancel payment"
    And Click on element by tag "button" and descendant tag "div" contains text "No"
    And Assert text under key "keyPurpose" is displayed
    And Assert text under key "nameKey" is displayed
    And Click on element by tag "span" and contains text "Cancel payment"
    And Wait for element by text "Do you wish to cancel?"
    And Assert element by contains text "Are you really sure to cancel payment"
    And Click on element by tag "button" and descendant tag "div" contains text "Yes"
    And Wait for first past payment
    And Wait for "2" seconds
    And Assert there is no element by contains text under key "keyPurpose" from txt file
    And Assert there is no element by contains text under key "nameKey" from txt file

    Examples:
      | rowindex |
      |        5 |


  @Payments_Upcoming_Payments_Details_Of_Payments_Transaction_On_The_List_Of_Transaction_[WEB]
  Scenario Outline: Payments_Upcoming_Payments_Details_Of_Payments_Transaction_On_The_List_Of_Transaction_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Past payments"
    And Click on normalized text "Upcoming payments"
    And Wait for element by contains text "List of upcoming payments"
    And Assert list of elements containing class "tw-block tw-text-gray-400" are displayed
    And Assert list of elements containing class "heading-5 medium" are displayed
    And Assert list of elements containing class "upcoming-payments tw-inline-block tw-align-middle tw-text-3" are displayed
    And Assert list of elements containing class "tw-gap-1 tw-items" are displayed
    And Assert list of upcoming transactions dates are all future dates
    And Click first Upcoming payments
    And Wait for element by contains text "Cancel payment"
    And Assert field "Recipient" in payment confirmation matches regex "^.+$"
    And Assert field "Recipient address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Recipient account" in payment confirmation matches regex "^\d{3}-\d{13}-\d{2}$"
    And Assert element by contains text "Urgent payment" is not displayed
    And Assert field "Purpose code" in payment confirmation matches regex "^\d{3}$"
    And Assert field "Order ID" in payment confirmation matches regex "^.{14}$"
    And Assert label "Debtor name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner"
    And Assert label "Debtor account" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    And Assert field "Debtor address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Payment status" in payment confirmation contains text "Pending"
    # prelazak na drugi racun
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Wait for "2" seconds
    And Click on element by containing text from Excel "<rowindex>" columnName "auth_current_account_bban"
    And Wait for "2" seconds
    And Assert list of elements containing class "tw-block tw-text-gray-400" are displayed
    And Assert list of elements containing class "heading-5 medium" are displayed
    And Assert list of elements containing class "upcoming-payments tw-inline-block tw-align-middle tw-text-3" are displayed
    And Assert list of elements containing class "tw-gap-1 tw-items" are displayed
    And Assert list of upcoming transactions dates are all future dates

    Then Click first Upcoming payments
    And Wait for element by contains text "Cancel payment"
    And Assert field "Recipient" in payment confirmation matches regex "^.+$"
    And Assert field "Recipient address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Recipient account" in payment confirmation matches regex "^\d{3}-\d{13}-\d{2}$"
    And Assert element by contains text "Urgent payment" is not displayed
    And Assert field "Purpose code" in payment confirmation matches regex "^\d{3}$"
    And Assert field "Order ID" in payment confirmation matches regex "^.{14}$"
    And Assert label "Debtor name" in payment confirmation contains value from excel "<rowindex>" columnName "auth_current_account_owner_name"
    And Assert label "Debtor account" in payment confirmation contains value from excel "<rowindex>" columnName "auth_current_account_bban"
    And Assert field "Debtor address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Payment status" in payment confirmation contains text "Pending"

    Examples:
      | rowindex |
      |        5 |