Feature: Currency_Exchange

  @Payments_Currency_Exchange_Pricelist_[WEB]-Overview
  Scenario Outline: Payments_Currency_Exchange_Pricelist_[WEB]-Overview

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by text "Domestic payment"
    And Click on normalized text "Currency exchange"
    And Wait for element by text "In order to get the best exchange rate please check if selected accounts are in the same bundle."
    And Assert element by normalized text "Currency exchange"

    And Assert "From" account selector in Currency exchange is displayed
    And Assert "To" account selector in Currency exchange is displayed
    And Assert accounts number is displayed in Currency exchange
    And Assert today date in currency exchange
    And Assert element by normalized text "Payment amount"
    And Assert "input" field with placeholder "0,00"
    And Assert element by xpath "//*[@id='toggle-dropdown']" match regex "^[A-Z]{3}$"
    And Assert element by normalized text "Discounted exchange rates"
    And Assert element by normalized text "General exchange rates"
    And Assert element by normalized text "Exchange"
    And Assert element by tag "div" contains text "Exchange" and ancestor tag "button" is disabled

    And Click on normalized text "General exchange rates"
    And Wait for element by xPath "//table"
    And Assert element by normalized text "Exchange rates"
    And Assert element by normalized text "The NLB Exchange List for Retail is used to calculate between different currencies."
    And Assert General exchange rates is displayed in Exchange rates screen

    And Assert today date with pattern "dd.MM.yyyy" is displayed
    And Assert element with attribute "src" contains value "AUD" is displayed
    And Assert element by contains text "1 AUD"
    And Assert element by contains text "Australia"
    And Assert element with attribute "src" contains value "BAM" is displayed
    And Assert element by contains text "1 BAM"
    And Assert element by contains text "Bosnia and Herzegovina"
    And Assert element with attribute "src" contains value "CAD" is displayed
    And Assert element by contains text "1 CAD"
    And Assert element by contains text "Canada"
    And Assert element with attribute "src" contains value "CHF" is displayed
    And Assert element by contains text "1 CHF"
    And Assert element by contains text "Switzerland"
    And Assert element with attribute "src" contains value "CNY" is displayed
    And Assert element by contains text "1 CNY"
    And Assert element by contains text "China"
    And Assert element with attribute "src" contains value "DKK" is displayed
    And Assert element by contains text "1 DKK"
    And Assert element by contains text "Denmark"
    And Assert element with attribute "src" contains value "EUR" is displayed
    And Assert element by contains text "1 EUR"
    And Assert element by contains text "European Union"
    And Assert element with attribute "src" contains value "GBP" is displayed
    And Assert element by contains text "1 GBP"
    And Assert element by contains text "United Kingdom"
    And Assert element with attribute "src" contains value "JPY" is displayed
    And Assert element by contains text "100 JPY"
    And Assert element by contains text "Japan"
    And Assert element with attribute "src" contains value "NOK" is displayed
    And Assert element by contains text "1 NOK"
    And Assert element by contains text "Norway"
    And Assert element with attribute "src" contains value "RUB" is displayed
    And Assert element by contains text "1 RUB"
    And Assert element by contains text "Russia"
    And Assert element with attribute "src" contains value "SEK" is displayed
    And Assert element by contains text "1 SEK"
    And Assert element by contains text "Sweden"
    And Assert element with attribute "src" contains value "USD" is displayed
    And Assert element by contains text "1 USD"
    And Assert element by contains text "United States"

    Then Click on normalized text "Back"
    And Wait for element by contains text "Discounted exchange rates"
    And Assert element by normalized text "Discounted exchange rates"
    And Assert element by normalized text "General exchange rates"

    Examples:
      | rowindex |
      |        4 |


  @Payments_Currency_Exchange_[WEB]-Buy_From_Payment
  Scenario Outline: Payments_Currency_Exchange_[WEB]-Buy_From_Payment

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    When Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "keyCurrentAccountAvailableBalance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "keyCurrentAccountCurrentBalance"
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_2_iban" under key "keyForeignAccountAvailableBalance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_2_iban" under key "keyForeignAccountCurrentBalance"

    And Click on tab "Payments" from main sidebar
    And Wait for element by text "Domestic payment"
    And Click on normalized text "Currency exchange"
    And Wait for element by contains text "From"
#    And Click on element by containing text "Discounted exchange rates"
#    And Wait for element by contains text "Bundle"
#    And Save exchange value rate for Sell exchange rate and remember it under key "keyExchangeRate"
#    And Click on normalized text "Back"

    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_iban"
    And Assert today date in currency exchange
    And Enter text "2" in "Payment amount" input field and remember under key "keyPaymentAmount"
    And Click on normalized text "Exchange"

    And Wait for element by tag "button" and normalized text "Cancel"
    And Save value from sibling of "Exchange" element with text under key "keyReducedAmount"
#    And Assert "Exchange" has a value under the key "keyExchangeRate" when multiplied by the value under the key "keyPaymentAmount"

    And Assert element by text "Exchange" has following sibling "span" with regex "\d+\.\d{2}\sRSD"
    And Assert element by text "To" has following sibling "span" with regex "\d+\.\d{2}\sEUR"
    And Assert element by text "To" has first following sibling that contains text from key "keyPaymentAmount"
#    And Assert element by text "From account" has following sibling "span" with text from Excel "<rowindex>" columnName "current_account_1_bban"
#    And Assert element by text "To account" has following sibling "span" with text from Excel "<rowindex>" columnName "current_account_2_iban"

    And Assert Exchange rate for label contains payment value from key "keyPaymentAmount" and has currency "EUR"
    And Assert element by contains text "Exchange rate for" contains numeric text match regex "\d+\.\d{4}"
    And Assert value date is todays date and in valid date format in Payment review
    And Assert element by text "Fee :" has following sibling "span" that contains text "0 RSD"
    And Assert element by normalized text "Cancel"
    And Assert element by normalized text "Back"
    And Click on element by tag "button" and descendant tag "div" contains text "Exchange"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount from key "keyReducedAmount" and currency "EUR" with message "Success"
    And Assert element by contains text "Currency exchange done"
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Wait for first past payment
    And Assert first past payment has amount from key "keyPaymentAmount" in currency "EUR"
    And Assert latest past payment has purpose "Kupo-prodaja deviza"
    And Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Refresh page
    And Wait for first past payment
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Wait for "3" seconds

    And Compare if current amount balance from key "keyCurrentAccountCurrentBalance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount from key "keyReducedAmount" is correct
    And Compare if available amount balance from key "keyCurrentAccountAvailableBalance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and reduced amount from key "keyReducedAmount" is correct
    And Compare if current amount balance from key "keyForeignAccountCurrentBalance" in my products screen for account from Exlce "<rowindex>" columnName "current_account_2_iban" and added amount "2" is correct
    And Compare if available amount balance from key "keyForeignAccountAvailableBalance" in my products screen for account from Excel "<rowindex>" columnName "current_account_2_iban" and added amount "2" is correct

    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Click on down arrow on first transaction do display details
#    And Wait for element by contains text "Transaction ID"
    And Assert that first transaction is "outgoing"
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for opened transaction in product screen is from key "keyReducedAmount" and currency "RSD"
    And Assert that purpose for first transaction in product screen is for currency exchange
    And Assert that currency for first transaction in product screen is "RSD"
#    And Assert that received amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert that amount for first transaction in product screen is from key "keyReducedAmount"
    And Assert element by text "Amount" has following sibling "dd" that contains text "RSD"
    And Assert element by text "Amount" has following sibling "dd" with regex "\d{2,3},\d{2}\sRSD"
#    And Assert element by text "Amount" has first following sibling that contains text from key "keyReducedRsdAmount"
    #And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Then Click on tab "My Products" from main sidebar
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Wait for first transaction in Product details
    And Click on down arrow on first transaction do display details
#    And Wait for element by contains text "Transaction ID"

    And Assert that first transaction is "incoming"
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for opened transaction in product screen is from key "keyPaymentAmount" and currency "EUR"
    And Assert that purpose for first transaction in product screen is for currency exchange
    And Assert that currency for first transaction in product screen is "EUR"
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert element by text "Amount" has following sibling "dd" that contains text "EUR"
    And Assert element by text "Amount" has following sibling "dd" with regex "\d{1,3},\d{2}\sEUR"
#    And Assert element by text "Amount" has first following sibling that contains text from key "keyPaymentAmount"
    #And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |


  @Payments_Currency_Exchange_[WEB]-Sell_From_Payment
  Scenario Outline: Payments_Currency_Exchange_[WEB]-Sell_From_Payment

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    When Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "keyCurrentAccountAvailableBalance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_1_bban" under key "keyCurrentAccountCurrentBalance"
    And Remember available balance for account from Excel "<rowindex>" columnName "current_account_2_iban" under key "keyForeignAccountAvailableBalance"
    And Remember current balance for account from Excel "<rowindex>" columnName "current_account_2_iban" under key "keyForeignAccountCurrentBalance"

    And Click on tab "Payments" from main sidebar
    And Wait for element by text "Domestic payment"
    And Click on normalized text "Currency exchange"
    And Wait for element by contains text "From"
#    And Click on element by containing text "Discounted exchange rates"
#    And Wait for element by contains text "Bundle"
#    And Save exchange value rate for Buy exchange rate and remember it under key "keyExchangeRate"
#    And Click on normalized text "Back"

    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_iban"
    And Click on account selector with index "2"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_1_bban"
    And Assert today date in currency exchange
    And Enter text "3" in "Payment amount" input field and remember under key "keyPaymentAmount"
    And Click on normalized text "Exchange"

    And Wait for element by tag "button" and normalized text "Cancel"
    And Save value from sibling of "To" element with text under key "keyReducedAmount"
#    And Assert "To" has a value under the key "keyExchangeRate" when multiplied by the value under the key "keyPaymentAmount"

    And Assert element by text "Exchange" has following sibling "span" with regex "\d+\.\d{2}\sEUR"
    And Assert element by text "To" has following sibling "span" with regex "\d+\.\d{2}\sRSD"
    And Assert element by text "Exchange" has first following sibling that contains text from key "keyPaymentAmount"
#    And Assert element by text "From account" has following sibling "span" with text from Excel "<rowindex>" columnName "current_account_1_bban"
#    And Assert element by text "To account" has following sibling "span" with text from Excel "<rowindex>" columnName "current_account_2_iban"

    And Assert value date is todays date and in valid date format in Payment review
    And Assert element by text "Fee :" has following sibling "span" that contains text "0 RSD"
    And Assert element by normalized text "Cancel"
    And Assert element by normalized text "Back"
    And Click on element by tag "button" and descendant tag "div" contains text "Exchange"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_2_iban" amount from key "keyReducedAmount" and currency "RSD" with message "Success"
    And Assert element by contains text "Currency exchange done"
    And Click on account selector with index "1"
    And Click on element from Excel "<rowindex>" contains text columnName "current_account_2_iban"
    And Wait for first past payment
    And Assert first past payment has amount from key "keyPaymentAmount" in currency "EUR"
    And Assert latest past payment has purpose "Kupo-prodaja deviza"
    And Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Click on tab "My Products" from main sidebar
    And Wait for first product to load
    And Wait for "5" seconds

    And Compare if current amount balance from key "keyCurrentAccountCurrentBalance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and added amount from key "keyReducedAmount" is correct
    And Compare if available amount balance from key "keyCurrentAccountAvailableBalance" in my products screen for account from Excel "<rowindex>" columnName "current_account_1_bban" and added amount from key "keyReducedAmount" is correct
    And Compare if current amount balance from key "keyForeignAccountCurrentBalance" in my products screen for account from Excel "<rowindex>" columnName "current_account_2_iban" and reduced amount "3" is correct
    And Compare if available amount balance from key "keyForeignAccountAvailableBalance" in my products screen for account from Excel "<rowindex>" columnName "current_account_2_iban" and reduced amount "3" is correct

    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Wait for first transaction in Product details
    And Click on down arrow on first transaction do display details
#    And Wait for element by contains text "Transaction ID"
    And Assert that first transaction is "incoming"
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for opened transaction in product screen is from key "keyReducedAmount" and currency "RSD"
    And Assert that purpose for first transaction in product screen is for currency exchange
    And Assert that currency for first transaction in product screen is "RSD"
    And Assert that amount for first transaction in product screen is from key "keyReducedAmount"
    And Assert element by text "Amount" has following sibling "dd" that contains text "RSD"
    And Assert element by text "Amount" has following sibling "dd" with regex "\d{2,3},\d{2}\sRSD"
#    And Assert element by text "Amount" has first following sibling that contains text from key "keyReducedRsdAmount"
    #And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by text "Products_Common_TransactionDetails_BookingDate" has following sibling "dd" with regex "\d{2}\.\d{2}\.\d{4}"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Then Click on tab "My Products" from main sidebar
    And Click on element by containing text from Excel "<rowindex>" columnName "current_account_2_iban"
    And Wait for first transaction in Product details
    And Click on down arrow on first transaction do display details
#    And Wait for element by contains text "Transaction ID"

    And Assert that first transaction is "outgoing"
    And Assert that transaction date for first transaction in product screen is today date
    And Assert that amount for opened transaction in product screen is from key "keyPaymentAmount" and currency "EUR"
    And Assert that purpose for first transaction in product screen is for currency exchange
    And Assert that currency for first transaction in product screen is "EUR"
    And Assert that amount for first transaction in product screen is from key "keyPaymentAmount"
    And Assert element by text "Amount" has following sibling "dd" that contains text "EUR"
    And Assert element by text "Amount" has following sibling "dd" with regex "\d{1,3},\d{2}\sEUR"
#    And Assert element by text "Amount" has first following sibling that contains text from key "keyPaymentAmount"
    #And Assert element by text "Account number" has following sibling "dd" with text from Excel "<rowindex>" columnName "current_account_1_bban"
    And Assert element by text "Transaction ID" has following sibling "dd" with regex "^.{14}$"

    Examples:
      | rowindex |
      |        5 |