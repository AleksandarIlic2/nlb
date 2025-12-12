Feature: Credit_Cards

  @Credit_Cards-Details-Financial_Details_[WEB]
  Scenario Outline: Credit_Cards-Details-Financial_Details_[WEB]
    #C71150

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Scroll to Product card with IBAN from Excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Wait for element by tag "nlb-product-detail-header"
    And Click on element by text "Details"
    And Wait for element by contains text "Financial details" with index "2"

    Then Assert Financial details in Loan details page is displayed with index 1
    And Assert Financial detail "Approved limit" has value with two decimal places and ends in "EUR"
    And Assert Financial detail "Spent this month" has value with two decimal places and ends in "EUR"
    And Assert Financial detail "Last statement amount" has value with two decimal places and ends in "EUR"
    And Assert Financial detail "Total spent" has value with two decimal places and ends in "EUR"
    And Assert Financial detail "Monthly ATM withdrawal limit" has value with two decimal places and ends in "EUR"
    And Assert Financial detail "Total spent" has value with two decimal places and ends in "EUR"
    And Assert Financial detail "Limit expiration" has value "Until cancellation" in attribute "textContent"
    And Assert element by contains text "Change limit amount"
    And Assert element by contains text "Repay limit"

    And Click on element by containing text "Change limit amount"
    And Wait for element by contains text "Change card limit order"
    And Assert element by tag "*" containing text "Change card limit order"
    And Scroll screen down
    And Click on element by tag "div" containing text "Cancel"
    And Wait for element by contains text "Financial details" with index "2"
    And Assert Financial details in Loan details page is displayed with index 1

    And Click on element by containing text "Repay limit"
    And Wait for element by contains text "UPN payment"
    And Assert element by tag "*" containing text "UPN payment"
    And Scroll screen "2" down
    And Click on element by text "Cancel"
    And Assert element by tag "h3" containing text "Are you sure?"
    And Assert element by tag "p" containing text "Cancelling now will terminate the payment process."
    And Click on element by text "Yes"
    And Wait for element by contains text "Financial details" with index "2"
    And Assert element by tag "h3" containing text "Financial details"

    Examples:
      | rowindex |
      |        1 |

  @Credit_Cards-Details-Card_Details_[WEB]
  Scenario Outline: Credit_Cards-Details-Card_Details_[WEB]
    #C71151

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Scroll to Product card with IBAN from Excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Wait for element by tag "nlb-product-detail-header"
    And Click on element by text "Details"

    Then Assert Card details is displayed with index 2
    And Assert Financial detail "Cardholder name" has value from Excel "<rowindex>" columnName "credit_card_premium_visa_one_card_holder_name" in attribute "textContent"
    And Assert Financial detail "Billing day" has value from Excel "<rowindex>" columnName "credit_card_premium_visa_one_billing_day" in attribute "textContent"
    And Assert Financial detail "Settlement day" has value from Excel "<rowindex>" columnName "credit_card_premium_visa_one_settlement_day" in attribute "textContent"
    And Assert Financial detail "Valid thru" has value from Excel "<rowindex>" columnName "credit_card_premium_visa_one_valid_through" in attribute "textContent"
    And Assert Financial detail "Status" has value "Active" in attribute "textContent"
    And Assert element by contains text "Document archive"

    And Click on normalized text "Document archive"
    And Assert element by tag "div" containing text "Documents archive"


    Examples:
      | rowindex |
      |        1 |

  @Credit_Cards-Transactions-List_[WEB]
  Scenario Outline: Credit_Cards-Transactions-List_[WEB]
    #C71134
    #Treba proveriti dokumentaciju ponovo nakon sto dobijemo kartice na uat

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Scroll to Product card with IBAN from Excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Wait for element by tag "nlb-product-detail-header"

    Then Assert tabs in Product details are displayed correctly for Credit Cards
    And Assert element by id "filters-header"
    And Assert element by tag "*" containing text "Download transaction list" is not displayed
    And Assert element with tag "input" attribute "type" and attribute value "search" is not displayed
    And Click on element by id "filters-header"
    And Assert element by tag "nlb-date-filter-selector" withn descendant tag "legend" containing text "Date range"
    And Assert element with text "Amount" is not displayed
    And Assert element by id "transactionsHeadingId" is not displayed
    And Assert element by tag "nlb-category-list" is not displayed
    And Assert element with text "Tags" is not displayed
    And Assert transactions are grouped by months for credit card transactions
    And Assert transaction is displayed correctly in Products details
    #Ne treba da ima search i export, RET-6564
    #And Assert Search bar is displayed correctly in Transactions list
    #And Assert export button is displayed correctly in Transaction list


    Examples:
      | rowindex |
      |        1 |

  @Credit_Cards-Transactions-Details_[WEB]
  Scenario Outline: Credit_Cards-Transactions-Details_[WEB]
    #C71144

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Scroll to Product card with IBAN from Excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Wait for element by tag "nlb-product-detail-header"
    And Click on down arrow on first transaction do display details

    Then Assert element by text "Amount" has following sibling "dd" with text "0,28 EUR"
    And Assert element by text "Settlement date" has following sibling "dd" with text "20.08.2025"
    And Assert element by text "Transaction ID" has following sibling "dd" that contains text "TX-EXT-"
    And Assert element by tag "span" containing text " Send message "
    And Assert element by tag "div" containing text "Confirmation" is not displayed

    Examples:
      | rowindex |
      |        1 |

  @Credit_Cards-Transactions-Filter-Date_Picker-Invalid_[WEB]
  Scenario Outline: Credit_Cards-Transactions-Filter-Date_Picker-Invalid_[WEB]
    #C71139

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Scroll to Product card with IBAN from Excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Click on element by containing text from Excel "<rowindex>" columnName "credit_card_premium_visa_one_iban"
    And Wait for element by tag "nlb-product-detail-header"
    And Click on element by containing class "icon-calendar-today"
    And Wait for element by contains text "Current month"

    Then Click on date 1 days in the past in second payment screen
    And Assert date 1 days in the past contains class "onlyOneSelected" in descendant "span"
    And Click on date 2 days in the past in second payment screen
    And Assert date 2 days in the past contains class "onlyOneSelected" in descendant "span"
    And Assert date 1 days in the past does not contain class "onlyOneSelected" in descendant "span"


    Examples:
      | rowindex |
      |        5 |