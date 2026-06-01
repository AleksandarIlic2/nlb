Feature: Cards

  @Cards-Transactions_Details_[WEB]-Debit_Cards
  Scenario Outline: Cards-Transactions_Details_[WEB]-Debit_Cards

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "Cards" from main sidebar
    And Wait for first Card in Cards menu
    And Click on element by containing text from Excel "<rowindex>" columnName "cards_item_debit_card_number"
    And Assert Card name from Cards menu in Card details is from Excel "<rowindex>" columnName "cards_item_debit_card_name"
    And Assert Card number from Cards menu in Card details is from Excel "<rowindex>" columnName "cards_item_debit_card_number"
    And Wait for first transaction in Product details
#    And Assert tabs in Product details are displayed correctly for Card from Cards menu

    And Click on down arrow on first transaction do display details
    And Assert element by text "Amount" has following sibling "dd" with regex "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
    And Assert element by text "Description" has following sibling "dd" with regex "^.+$"
    And Assert element by text "Authorization date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Amount in local currency" has following sibling "dd" with regex "^\d{1,3}(\.\d{3})*,\d{2}\s*RSD$"
    And Assert element by text "Settlement date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.+$"
#    And Assert element by tag "span" containing text "Send message"
#    And Assert element by tag "div" containing text "Confirmation" is not displayed

    Then Click on down arrow on first transaction do display details
    And Assert element by contains text "Value date" is not displayed

    Examples:
      | rowindex |
      |        1 |


  @Cards-Transactions_Details_[WEB]-Credit_Cards
  Scenario Outline: Cards-Transactions_Details_[WEB]-Credit_Cards

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on tab "Cards" from main sidebar
    And Wait for first Card in Cards menu
    And Click on element by containing text from Excel "<rowindex>" columnName "cards_item_credit_card_number"
    And Assert Card name from Cards menu in Card details is from Excel "<rowindex>" columnName "cards_item_credit_card_name"
    And Assert Card number from Cards menu in Card details is from Excel "<rowindex>" columnName "cards_item_credit_card_number"
    And Wait for first transaction in Product details
#    And Assert tabs in Product details are displayed correctly for Card from Cards menu

    And Click on down arrow on first transaction do display details
    And Assert element by text "Amount" has following sibling "dd" with regex "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
    And Assert element by text "Description" has following sibling "dd" with regex "^.+$"
    And Assert element by text "Authorization date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Amount in local currency" has following sibling "dd" with regex "^\d{1,3}(\.\d{3})*,\d{2}\s*RSD$"
    And Assert element by text "Settlement date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Value date" has following sibling "dd" with regex "^\d{2}\.\d{2}\.\d{4}$"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.+$"
#    And Assert element by tag "span" containing text "Send message"
#    And Assert element by tag "div" containing text "Confirmation" is not displayed

    Then Click on down arrow on first transaction do display details
    And Assert element by contains text "Value date" is not displayed

    Examples:
      | rowindex |
      |        1 |