Feature: Dashboard
# u NOT DELIVERED SU STATUSU SVI TESTOVI U OVOM FEATURE (SVAKAKO IH TREBA DOPUNITI SA STVARIMA KOJE SU VEC STIGLE!)
#  @General-Dashboard-Quick_Links_[WEB]
#  Scenario Outline: General-Dashboard-Quick_Links_[WEB]
#
#    Given Open Login page
#    And Change language to English
#    And Login to the page using user from Excel "<rowindex>" columnName "username"
#    When Wait for element by text "Pay or transfer"
#
#    Then Assert sidebar is displayed by contains class "3xl:tw-min-w-sidebarNavigation"
#    And Assert notification bell at the right top corner of the screen
#    And Assert user profile icon at the right top corner of the screen
#
#    Examples:
#      | rowindex |
#      |        1 |
#
#    @General-Dashboard-Clickable_links_[WEB]
#    Scenario Outline: General-Dashboard-Clickable_links_[WEB]
#
#      Given Open Login page
#      And Change language to English
#      And Login to the page using user from Excel "<rowindex>" columnName "username"
#      When Wait for element by text "Pay or transfer"
#      #notification bell and user profile icon
#      And Assert element by contains class "icon-bell" is displayed
#      And Assert element by contains label "User profile" is displayed
#
#      And Assert element by text "NLB Online Offer"
#      And Assert element by text " Latest transactions "
#
#      #swipe accounts and cards
#      And Click on right arrow "1" times
#      And Assert element by text " Available balance " index "2" is displayed
#      And Assert element by text " Current balance " index "2" is displayed
#      And Assert account number with index "2" is displayed
#
#      And Click on left arrow "4" times
#      And Click on element by text "Show all"
#      When Wait for element by text " Download transaction list "
#
#      Examples:
#        | rowindex |
#        |        1 |
#
  @General_Dashboard_Page_overview_[WEB]
  Scenario Outline: General_Dashboard_Page_overview_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by contains text "Balance"

    When Assert sidebar "My NLB" is displayed
    And Assert sidebar "My Products" is displayed
    And Assert sidebar "Payments" is displayed
    And Assert sidebar "Cards" is displayed
    And Assert sidebar "Recipients" is displayed
    And Assert sidebar "Messages" is displayed
    And Assert sidebar "Offers" is displayed
    And Assert sidebar "Help" is displayed
    And Assert sidebar "Logout" is displayed
    And Assert element by text "Pay or transfer"

    And Assert notification bell at the right top corner of the screen
    #And Assert user profile icon has value from excel "<rowindex>" columnName "user_profile_icon"
    And Assert element by tag "h3" containing text "Balance"
    And Click on tab "My Products" from main sidebar
    And Assert that products in my products have loaded
    And Remember current and available balances for account from Excel "<rowindex>" columnName "current_account_1_bban" under keys "current_balance" and "available_balance" and assert "RSD" currency
    And Click on tab "My NLB" from main sidebar
    And Wait for element by contains text "Balance"
    And Assert element with attribute "src" contains value "product-icon/CurrentAccount" is displayed
    And Assert product from Excel "<rowindex>" with name "current_account_1_name" and iban "current_account_1_bban" is displayed as active on dashboard

    And Assert currently active product on dashboard has current and available balance from keys "current_balance" and "available_balance"
    And Remember latest transaction purposes from dashboard under key "latest_transaction_purposes"
    And Click on element by aria label "Next slide"
    #And Assert product from Excel "<rowindex>" with name "second_personal_account_name" and iban "second_personal_account_iban" is displayed as active on dashboard
    And Assert latest transaction purposes from dashboard are not the same as in key "latest_transaction_purposes"
    And Wait for "3" seconds
    And Click on element by aria label "Previous slide"

    And Assert product from Excel "<rowindex>" with name "current_account_1_name" and iban "current_account_1_bban" is displayed as active on dashboard
    And Assert element by tag "h3" containing text "Latest transactions"
    And Click on element by text "Show all"
    And Wait for element by tag "nlb-bban"

    And Remember first "3" transaction purposes under key "transactions_purposes"
    And Click on tab "My NLB" from main sidebar
    And Wait for element by text "Show all"
    And Assert transactions shown in dashboard are the same as in key "transactions_purposes"

    And Assert element by tag "*" containing text "Upcoming payments"
    And Click on element by text "Show all" index "2"
    And Wait for element by tag "a" and normalized text "Upcoming payments"
    And Wait for "1" seconds
    And Assert payments in past payments have loaded
    And Remember first "3" payment purposes under key "payments_purposes"
    And Click on tab "My NLB" from main sidebar
    And Wait for element by text "Show all"
    And Assert payments shown in dashboard are the same as in key "payments_purposes"

    Then Assert element by contains text "Currency exchange"
    And Click on element by containing text "Currency exchange"
    And Wait for element by contains text "From account"
    And Click on tab "My NLB" from main sidebar
    And Wait for element by contains text "Shortcuts"
    And Assert element by contains text "NLB Online offers"
    And Click on element by containing text "NLB Online offers"
    And Wait for element by contains text "Offers_OffersTile_Screentitle"
    And Click on tab "My NLB" from main sidebar
    And Wait for element by contains text "Shortcuts"
    And Assert element by contains text "NLB Funds"
    And Assert element by contains text "Branches and ATMs"
    # todo da li dodati proveru da precice vode na odredjene linkove i otvaraju novi tab

    Examples:
      | rowindex |
      |        1 |