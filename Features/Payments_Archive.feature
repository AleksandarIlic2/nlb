Feature: Payments_Archive

  @Payments-Payments_Archive-Filter_Payments_By_Date_[WEB]
  Scenario Outline: Payments-Payments_Archive-Filter_Payments_By_Date_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Domestic payment"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    And Click on element by id "filters-header"

    And Assert element by text "Date range"
    And Assert element by contains class "icon-calendar-today" with index "1"
    And Assert element by contains class "icon-calendar-today" with index "2"
    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"
    And Assert element by contains text "From"
    And Assert element by contains text "To"

    And Assert element by contains text "Amount"
    And Assert element by contains text "From"
    And Assert element by contains text "To"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "1"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "2"
    And Assert NLB button "Confirm"
    And Assert NLB button "Clear filters"

    Then Click on element by containing class "icon-calendar-today" with index "1"
    And Select date in From label to be "28.04.2026"
    And Select date in To label to be "30.04.2026"
    And Click on NLB button "Confirm"
    And Wait for first past payment
    And Assert transaction dates in Past payments are between "28.04.2026" and "30.04.2026"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Payments_Archive_Filter_Payments_By_Amount-Invalid_[WEB]
  Scenario Outline: Payments_Payments_Archive_Filter_Payments_By_Amount-Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Domestic payment"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    And Click on element by id "filters-header"

    And Assert element by text "Date range"
    And Assert element by contains class "icon-calendar-today" with index "1"
    And Assert element by contains class "icon-calendar-today" with index "2"
    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"
    And Assert element by contains text "From"
    And Assert element by contains text "To"

    And Assert element by contains text "Amount"
    And Assert element by contains text "From"
    And Assert element by contains text "To"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "1"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "2"
    And Assert NLB button "Confirm"
    And Assert NLB button "Clear filters"

    Then Enter text "100" in field by xPath "(//label[contains(text(),'From')]//following-sibling::div/input)[1]"
    And Enter text "50" in field by xPath "(//label[contains(text(),'To')]//following-sibling::div/input)[1]"
#    And Assert element by contains text "From amount must be smaller than To amount."
    And Assert element by contains text "ValidationError"

    Examples:
      | rowindex |
      |        1 |


  @Payments_Payments_Archive_Filter_Payments_By_Status_[WEB]
  Scenario Outline: Payments_Payments_Archive_Filter_Payments_By_Status_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Domestic payment"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded
    And Click on element by id "filters-header"

    And Assert element by text "Date range"
    And Assert element by contains class "icon-calendar-today" with index "1"
    And Assert element by contains class "icon-calendar-today" with index "2"
    And Assert element by contains text "Last 7 days"
    And Assert element by contains text "This month"
    And Assert element by contains text "Last month"
    And Assert element by contains text "From"
    And Assert element by contains text "To"

    And Assert element by contains text "Amount"
    And Assert element by contains text "From"
    And Assert element by contains text "To"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "1"
    And Assert element by contains class "white tw-border-0 tw-border" containing aria label "RSD" with index "2"
    And Assert NLB button "Confirm"
    And Assert NLB button "Clear filters"

    And Click on element by containing text "Executed"
    And Click on NLB button "Confirm"
    And Assert transaction status in Past payments are Executed

    And Click on element by containing text "Executed"
    And Click on element by containing text "Rejected"
    And Click on element by containing text "Confirm"
#    And Assert transaction status in Past payments are Rejected

    And Click on element by containing text "Executed"
    And Click on NLB button "Confirm"
    And Assert transaction status in Past payments are Executed or Rejected

    Examples:
      | rowindex |
      |        4 |


  @Payments_Payments_Archive-Create_Confirmation_[WEB]
  Scenario Outline: Payments_Payments_Archive-Create_Confirmation_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Domestic payment"
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded

    Then Remember all transaction values from the Executed past payment
    And Click on element by text "Confirmation"
    And Assert document with name starting with "Potvrda" and has file type ".pdf" is downloaded
    And Assert that Executed past payment transaction values in PDF match remembered values

    Examples:
      | rowindex |
      |        1 |


  @Payments_Payments_Archive-Payments_List_[WEB]
  Scenario Outline: Payments_Payments_Archive-Payments_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Past payments"
    And Wait for "2" seconds
    And Click on element by containing text "Past payments"
    And Assert payments in past payments have loaded

#    Then Assert icons for Upcoming payments are displayed
    And Assert dates of Payments archive are displayed correctly
    And Assert list of elements by xPath "//h5" are displayed
    And Assert list of creditor names of Payments archive are displayed
#    And Assert list of amounts with currencies of Upcoming payments are displayed correctly

    And Click on element by xpath "//nlb-account-selector"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Assert dates of Payments archive are displayed correctly
    And Assert list of elements by xPath "//h5" are displayed
    And Assert list of creditor names of Payments archive are displayed
#    And Assert list of amounts with currencies of Upcoming payments are displayed correctly

    Then Click on element by xpath "//nlb-account-selector"
    And Click on element from Excel "<rowindex>" contains text columnName "savings_account_1_number"
    And Assert dates of Payments archive are displayed correctly
    And Assert list of elements by xPath "//h5" are displayed
    And Assert list of creditor names of Payments archive are displayed
#    And Assert list of amounts with currencies of Upcoming payments are displayed correctly

    Examples:
      | rowindex |
      |        1 |


  @Payments_Payments_Archive_Payments_Details_[WEB]
  Scenario Outline: Payments_Payments_Archive_Payments_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Past payments"
    And Wait for first past payment
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Wait for "2" seconds
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for "2" seconds
    And Click on first Executed past payment
    And Wait for element by contains text "Confirmation"

    And Assert element by contains text "Confirmation"
    And Assert element by contains text "Repeat payment"
    And Assert field "Recipient" in payment confirmation matches regex "^.+$"
    And Assert field "Recipient address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Recipient account" in payment confirmation matches regex "^\d{3}-\d{13}-\d{2}$"
    And Assert field "Urgent payment" in payment confirmation matches regex "^(Yes|No)$"
    And Assert field "Purpose code" in payment confirmation matches regex "^\d{3}$"
    And Assert field "Purpose" in payment confirmation matches regex "^.+$"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert field "Order ID" in payment confirmation matches regex "^.{14}$"
    And Assert label "Debtor name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner"
    And Assert label "Debtor account" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_bban"
    And Assert field "Debtor address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Fee" in payment confirmation matches regex "^\d{1,2},\d{2}\s*RSD$"
    And Assert field "Payment status" in payment confirmation contains text "Executed"

    And Click on element by containing class "icon-chevron-down" with index "1"
    And Wait for "2" seconds
    And Click on element by containing text from Excel "<rowindex>" columnName "auth_current_account_bban"
    And Wait for "2" seconds
    And Click on first Executed past payment
    And Wait for element by contains text "Confirmation"

    And Assert element by contains text "Confirmation"
    And Assert element by contains text "Repeat payment"
    And Assert field "Recipient" in payment confirmation matches regex "^.+$"
    And Assert field "Recipient address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Recipient account" in payment confirmation matches regex "^\d{3}-\d{13}-\d{2}$"
    And Assert field "Urgent payment" in payment confirmation matches regex "^(Yes|No)$"
    And Assert field "Purpose code" in payment confirmation matches regex "^\d{3}$"
    And Assert field "Purpose" in payment confirmation matches regex "^.+$"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert field "Order ID" in payment confirmation matches regex "^.{14}$"
    And Assert label "Debtor name" in payment confirmation contains value from excel "<rowindex>" columnName "auth_current_account_owner_name"
    And Assert label "Debtor account" in payment confirmation contains value from excel "<rowindex>" columnName "auth_current_account_bban"
    And Assert field "Debtor address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Fee" in payment confirmation matches regex "^\d{1,2},\d{2}\s*RSD$"
    And Assert field "Payment status" in payment confirmation contains text "Executed"

    And Click on element by containing class "icon-chevron-down" with index "1"
    And Wait for "2" seconds
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_iban"
    And Wait for "2" seconds
    And Click on first Executed past payment
    And Wait for element by contains text "Confirmation"

    And Assert element by contains text "Confirmation"
    And Assert element by contains text "Repeat payment"
    And Assert field "Recipient" in payment confirmation matches regex "^.+$"
    And Assert field "Recipient address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Recipient account" in payment confirmation matches regex "^\d{3}-\d{13}-\d{2}$"
    And Assert field "Urgent payment" in payment confirmation matches regex "^(Yes|No)$"
    And Assert field "Purpose code" in payment confirmation matches regex "^\d{3}$"
    And Assert field "Purpose" in payment confirmation matches regex "^.+$"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert field "Order ID" in payment confirmation matches regex "^.{14}$"
    And Assert label "Debtor name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner"
    And Assert label "Debtor account" in payment confirmation contains value from excel "<rowindex>" columnName "current_account_1_iban"
    And Assert field "Debtor address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Fee" in payment confirmation matches regex "^\d{1,2},\d{2}\s*RSD$"
    And Assert field "Payment status" in payment confirmation contains text "Executed"

    Then Click on element by containing class "icon-chevron-down" with index "1"
    And Wait for "2" seconds
    And Click on element by containing text from Excel "<rowindex>" columnName "savings_account_1_number"
    And Wait for "2" seconds
    And Click on first Executed past payment
    And Wait for element by contains text "Confirmation"

    And Assert element by contains text "Confirmation"
    And Assert element by contains text "Repeat payment"
    And Assert field "Recipient" in payment confirmation matches regex "^.+$"
    And Assert field "Recipient address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Recipient account" in payment confirmation matches regex "^\d{3}-\d{13}-\d{2}$"
    And Assert field "Urgent payment" in payment confirmation matches regex "^(Yes|No)$"
    And Assert field "Purpose code" in payment confirmation matches regex "^\d{3}$"
    And Assert field "Purpose" in payment confirmation matches regex "^.+$"
    And Assert field "Payment date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4},\s\d{2}:\d{2}$"
    And Assert field "Execution date" in payment confirmation matches regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert field "Order ID" in payment confirmation matches regex "^.{14}$"
    And Assert label "Debtor name" in payment confirmation contains value from excel "<rowindex>" columnName "account_details_owner"
    And Assert label "Debtor account" in payment confirmation contains value from excel "<rowindex>" columnName "savings_account_1_number"
    And Assert field "Debtor address" in payment confirmation matches regex "(?s)^.+$"
    And Assert field "Fee" in payment confirmation matches regex "^\d{1,2},\d{2}\s*RSD$"
    And Assert field "Payment status" in payment confirmation contains text "Executed"

    Examples:
      | rowindex |
      |        8 |