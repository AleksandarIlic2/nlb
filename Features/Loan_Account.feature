Feature: Loan_Account

  @Loan_Accounts-Details_[WEB]
  Scenario Outline: Loan_Accounts-Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded
    And Wait for first product to load

    When Scroll to account from excel "<rowindex>" columnName "loan_account_2_number" in my products page
    And Assert that loan accounts are sorted correctly
    And Assert Loan accounts icons is displayed
    And Assert Loan accounts product names is displayed
    And Assert Loan accounts account numbers is displayed
    And Assert Loan accounts current loan balance is displayed

    Then Click on element from Excel "<rowindex>" contains text columnName "loan_account_2_number"
    And Wait for product details to load
    And Assert Loan labels are displayed in the following order:
      | Financial details   |
      | Account details     |

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Header_[WEB]
  Scenario Outline: Loan_Accounts-Header_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    When Scroll to account from excel "<rowindex>" columnName "loan_account_2_number" in my products page

    Then Click on element from Excel "<rowindex>" contains text columnName "loan_account_2_number"
    And Wait for product details to load
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_name" is displayed
    And Assert Loan account tabs is displayed correctly
    And Assert element by xPath "(//nlb-amount)[1]" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
    And Assert Loan labels are displayed in the following order:
      | Financial details   |
      | Account details     |

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Annuity_Plan_[WEB]
  Scenario Outline: Loan_Accounts-Annuity_Plan_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "loan_account_2_number" in my products page

    When Click on element from Excel "<rowindex>" contains text columnName "loan_account_2_number"
    And Wait for product details to load
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_name" is displayed
    And Assert Loan account tabs is displayed correctly
    And Assert element by xPath "(//nlb-amount)[1]" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
#    And Assert Loan labels are displayed in the following order:
#      | Financial details   |
#      | Account details     |

    Then Click on element by containing text "Annuity"
    And Wait for element by contains text "Installments"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert element by xPath "//input" and index 0 is displayed
    And Assert element by xPath "//input" and index 1 is displayed
    And Assert element by contains class "icon-calendar" with index "1"
    And Assert element by contains class "icon-calendar" with index "2"
#    And Assert element by text "Annuity"
#    And Assert element by text "Principal"
    And Assert Upcoming installments dates are sorted ascending for Loan annuitys
    And Assert list of Annuity amount is displayed correctly
    And Assert list of Principal amount is displayed correctly

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Annuity_Plan-Filter_[WEB]
  Scenario Outline: Loan_Accounts-Annuity_Plan-Filter_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "loan_account_2_number" in my products page

    When Click on element from Excel "<rowindex>" contains text columnName "loan_account_2_number"
    And Wait for product details to load
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_name" is displayed
    And Assert element by text "Details"
    And Assert element by contains text "Payments"
    And Assert element by contains text "Annuity"
    And Assert element by xPath "(//nlb-amount)[1]" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
    And Assert Loan labels are displayed in the following order:
      | Financial details   |
      | Account details     |

    Then Click on element by containing text "Annuity"
    And Wait for element by contains text "Installments"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert element by xPath "//input" and index 0 is displayed
    And Assert element by xPath "//input" and index 1 is displayed
    And Assert element by contains class "icon-calendar" with index "1"
    And Assert element by contains class "icon-calendar" with index "2"
#    And Assert element by text "Annuity"
#    And Assert element by text "Principal"
    And Assert Upcoming installments dates are sorted ascending for Loan annuitys
    And Assert list of Annuity amount is displayed correctly
    And Assert list of Principal amount is displayed correctly

    And Click on calendar icon with index "1"
    And Select date in From label to be "02.01.2027"
    And Select date in To label to be "15.08.2027"
    And Wait for "5" seconds
    And Assert transaction dates in Loans are between "02.01.2026" and "15.08.2027"

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Annuity_Plan-Filter-invalid_[WEB]
  Scenario Outline: Loan_Accounts-Annuity_Plan-Filter-invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "loan_account_2_number" in my products page

    When Click on element from Excel "<rowindex>" contains text columnName "loan_account_2_number"
    And Wait for product details to load
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_name" is displayed
    And Assert element by text "Details"
    And Assert element by contains text "Payments"
    And Assert element by contains text "Annuity"
    And Assert element by xPath "(//nlb-amount)[1]" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
    And Assert Loan labels are displayed in the following order:
      | Financial details   |
      | Account details     |

    Then Click on element by containing text "Annuity"
    And Wait for element by contains text "Installments"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert element by xPath "//input" and index 0 is displayed
    And Assert element by xPath "//input" and index 1 is displayed
    And Assert element by contains class "icon-calendar" with index "1"
    And Assert element by contains class "icon-calendar" with index "2"
#    And Assert element by text "Annuity"
#    And Assert element by text "Principal"
    And Assert Upcoming installments dates are sorted ascending for Loan annuitys
    And Assert list of Annuity amount is displayed correctly
    And Assert list of Principal amount is displayed correctly

    And Click on calendar icon with index "1"
    And Select date in From label to be "22.01.2027"
    And Click on calendar icon with index "2"
    And Assert date "11.01.2027" is not clickable

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Payments_[WEB]
  Scenario Outline: Loan_Accounts-Payments_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "loan_account_2_number" in my products page

    When Click on element from Excel "<rowindex>" contains text columnName "loan_account_2_number"
    And Wait for product details to load
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_name" is displayed
    And Assert Loan account tabs is displayed correctly
    And Assert element by xPath "(//nlb-amount)[1]" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
#    And Assert Loan labels are displayed in the following order:
#      | Financial details   |
#      | Account details     |

#    Then Click on element by containing text "Payments_Action"
    Then Click on loan tab "Payments"
    And Wait for element by contains text "Payments found:"
    And Assert element by contains text "From"
    And Assert element by contains text "To"
    And Assert element by xPath "//input" and index 0 is displayed
    And Assert element by xPath "//input" and index 1 is displayed
    And Assert element by contains class "icon-calendar" with index "1"
    And Assert element by contains class "icon-calendar" with index "2"

#    And Assert element by contains text "RSD"
#    And Assert element by contains text "Value in loan currency"
#    And Assert element by contains text "Value in local currency"
    And Assert Payments dates are sorted descending for Loans payments
    And Assert list of Value in loan currency amount is displayed correctly
    And Assert list of Value in local currency amount is displayed correctly

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Payments-Filter_[WEB]
  Scenario Outline: Loan_Accounts-Payments-Filter_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "loan_account_2_number" in my products page

    When Click on element from Excel "<rowindex>" contains text columnName "loan_account_2_number"
    And Wait for product details to load
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_name" is displayed
    And Assert element by text "Details"
#    And Assert element by contains text "Payments_Action"
#    And Assert element by contains text "AnnuityPlan"
    And Assert Loan account tabs is displayed correctly
    And Assert element by xPath "(//nlb-amount)[1]" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
    And Assert Loan labels are displayed in the following order:
      | Financial details   |
      | Account details     |

    Then Click on loan tab "Payments"
    And Wait for element by contains text "Payments found:"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert element by xPath "//input" and index 0 is displayed
    And Assert element by xPath "//input" and index 1 is displayed
    And Assert element by contains class "icon-calendar" with index "1"
    And Assert element by contains class "icon-calendar" with index "2"

#    And Assert element by contains text "RSD"
#    And Assert element by text " Value in loan currency "
#    And Assert element by text " Value in local currency "
    And Assert Payments dates are sorted descending for Loans payments
    And Assert list of Value in loan currency amount is displayed correctly
    And Assert list of Value in local currency amount is displayed correctly

    And Click on calendar icon with index "1"
    And Select date in From label to be "30.04.2025"
    And Select date in To label to be "30.06.2025"
    And Wait for element by contains text "Payments found:"
    And Wait for first Loan payment to load
    And Wait for "5" seconds
    And Assert transaction dates in Loans are between "30.04.2025" and "30.06.2025"

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Payments-Filter-invalid_[WEB]
  Scenario Outline: Loan_Accounts-Payments-Filter-invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded
    And Scroll to account from excel "<rowindex>" columnName "loan_account_2_number" in my products page

    When Click on element from Excel "<rowindex>" contains text columnName "loan_account_2_number"
    And Wait for product details to load
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_number" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_name" is displayed
    And Assert element by text "Details"
    And Assert Loan account tabs is displayed correctly
    And Assert element by xPath "(//nlb-amount)[1]" has text in format "^\d{1,3}(\.\d{3})*,\d{2}\s*[A-Z]{3}$"
    And Assert Loan labels are displayed in the following order:
      | Financial details   |
      | Account details     |

    Then Click on loan tab "Payments"
    And Wait for element by contains text "Payments found:"
    And Assert element by text "From"
    And Assert element by text "To"
    And Assert element by xPath "//input" and index 0 is displayed
    And Assert element by xPath "//input" and index 1 is displayed
    And Assert element by contains class "icon-calendar" with index "1"
    And Assert element by contains class "icon-calendar" with index "2"

#    And Assert element by contains text "RSD"
#    And Assert element by text " Value in loan currency "
#    And Assert element by text " Value in local currency "
    And Assert Payments dates are sorted descending for Loans payments
    And Assert list of Value in loan currency amount is displayed correctly
    And Assert list of Value in local currency amount is displayed correctly

    And Click on calendar icon with index "1"
    And Select date in From label to be "30.03.2026"
    And Click on calendar icon with index "2"
    And Assert contains aria label button "Previous month" is not clickable
    And Assert date "15.03.2026" is not clickable

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Details-Financial_Details_[WEB]
  Scenario Outline: Loan_Accounts-Details-Financial_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Scroll to account from excel "<rowindex>" columnName "loan_account_2_number" in my products page
    And Click on element from Excel "<rowindex>" contains text columnName "loan_account_2_number"
    And Wait for product details to load
    And Assert tabs in Product details are displayed correctly for Loans
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_number" is displayed
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "loan_account_2_name"
    And Assert Loan account tabs is displayed correctly

    Then Assert label with text "Opening amount" has value with text in format "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s[A-Z]{3}$"
    And Assert label with text "Annuity" has value with text in format "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s[A-Z]{3}$"
    And Assert label with text "Nominal interest rate" has value with text in format "^\d{1,3},\d{2}%$"
    And Assert label with text "Last installment date" has value with text in format "^\d{2}\.\d{2}\.\d{4}$"
    And Assert label with text "Next installment date" has value with text in format "^\d{2}\.\d{2}\.\d{4}$"
    And Assert label with text "Remaining principal amount" has value with text in format "^(?:0|[1-9]\d{0,2}(?:\.\d{3})*),\d{2}\s[A-Z]{3}$"

    Examples:
      | rowindex |
      |        5 |


  @Loan_Accounts-Details-Account_Details_[WEB]
  Scenario Outline: Loan_Accounts-Details-Account_Details_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    When Scroll to account from excel "<rowindex>" columnName "loan_account_2_number" in my products page
    And Click on element from Excel "<rowindex>" contains text columnName "loan_account_2_number"
    And Wait for product details to load
    And Assert element by contains text from excel "<rowindex>" columnName "loan_account_2_number" is displayed
    And Assert Product name in Product details is from Excel "<rowindex>" columnName "loan_account_2_name"
    And Assert Loan account tabs is displayed correctly

    Then Assert label with text "Account owner" has value with text from Excel "<rowindex>" columnName "account_details_owner"
    And Assert label with text "Start date" has value with text in format "^\d{2}\.\d{2}\.\d{4}$"
    And Assert label with text "Repayment period" has value with text in format "^(?:0|[1-9]\d*)\sMonths$"
    And Assert label with text "Remaining period" has value with text in format "^(?:0|[1-9]\d*)\sMonths$"

    Examples:
      | rowindex |
      |        5 |