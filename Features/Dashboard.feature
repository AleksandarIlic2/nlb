#Feature: Dashboard
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
#  @General-Dashboard-Page_overview_[WEB]
#  Scenario Outline: General-Dashboard-Page_overview_[WEB]
#
#    Given Open Login page
#    And Change language to English
#    And Login to the page using user from Excel "<rowindex>" columnName "username"
#
#    When Wait for element by text "Pay or transfer"
#
#    Then Assert sidebar is displayed by contains class "3xl:tw-min-w-sidebarNavigation"
#    And Assert notification bell at the right top corner of the screen
#    And Assert user profile icon at the right top corner of the screen
#    And Assert default account is displayed
#    And Assert section "Latest transactions" by text
#
#    Examples:
#      | rowindex |
#      |        1 |