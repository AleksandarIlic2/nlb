#Feature: General
#
#  @General-Login_Page_Elements-Overview_PreLogin_Page_[WEB]
#  Scenario Outline: General-Login_Page_Elements-Overview_PreLogin_Page_[WEB]
#
#    Given Open Login page
#    And Change language to English
#    #Login_Description --> Promeniti kada poprave lokalizaciju
#    And Assert element by contains class "min tw-flex"
#    And Assert element by contains class "gray-400 body"
#    And Assert element by contains class "subheadline" containing text "Username"
#    And Assert "Username" input field in preLogin
#    And Assert element by contains class "subheadline" containing text "One-time password"
#    And Assert "One-time password" input field in preLogin
#
#    When Assert toggle button in preLogin is displayed
#    And Assert hamburger menu in preLogin is displayed
#
#    Then Assert element by class "tw-items-center" containing text "Login to NLB Klik"
#    And Assert element by class "tw-items-center" containing text "Forgotten credentials?"
#    And Assert element by class "tw-items-center" containing text "Activate NLB Klik"
#    And Assert element by contains src "nlb-logo-outline" is displayed
#    And Assert element by contains src "NLB_white_wordmark" and contains class "tw-hidden portrait" is displayed
#
#    Examples:
#      | rowindex |
#      |        1 |
#
#
#  @General-Login_Page_Elements-Links_[WEB]
#  Scenario Outline: General-Login_Page_Elements-Links_[WEB]
#
#    Given Open Login page
#    And Change language to English
#    #Login_Description --> Promeniti kada poprave lokalizaciju
#    And Assert element by contains class "min tw-flex"
#    And Assert element by contains class "gray-400 body"
#    And Assert element by contains class "subheadline" containing text "Username"
#    And Assert "Username" input field in preLogin
#    And Assert element by contains class "subheadline" containing text "One-time password"
#    And Assert "One-time password" input field in preLogin
#
#    When Assert toggle button in preLogin is displayed
#    And Assert hamburger menu in preLogin is displayed
#
#    And Assert element by class "tw-items-center" containing text "Login to NLB Klik"
#    And Assert element by class "tw-items-center" containing text "Forgotten credentials?"
#    And Assert element by class "tw-items-center" containing text "Activate NLB Klik"
#    And Assert element by contains src "nlb-logo-outline" is displayed
#    And Assert element by contains src "NLB_white_wordmark" and contains class "tw-hidden portrait" is displayed
#
#    Then Click on element by containing text "Activate NLB Klik"
#    And Assert element by contains class "bold heading" containing text "Activation"
#    And Assert element by contains text "To activate online bank, call NLB contact center via phone call"
#    And Assert element by contains text "OK"
#    And Click on element by containing text "OK"
#
#    And Click on element by containing text "Forgotten credentials?"
#    And Assert element by contains class "bold heading" containing text "Forgotten credentials instructions"
#    And Assert element by contains class "heading-5 ng-star" containing text "Forgotten username"
#    And Assert element by contains text "If you forgot your username or PIN, please call our Contact center on 011 201 86 00"
##    And Assert element by contains class "heading-5 ng-star" containing text "Forgotten PIN"
##    And Assert element by contains text "If you forgot your PIN, contact us via phone call"
#    And Assert element by contains text "OK"
#    And Click on element by containing text "OK"
#
#    Examples:
#      | rowindex |
#      |        1 |