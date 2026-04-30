Feature: Authentication

  @Authentication-Web_Login-Logout_[WEB]
  Scenario Outline: Authentication-Web_Login-Logout_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    Then Click on tab "Logout" from main sidebar
    And Assert element by tag "div" contains text "NLB" and descendant tag "span" contains text "Klik"

    Examples:
      | rowindex |
      |        1 |


  @Authentication-Web_Login-Login_With_OTP_[WEB]
  Scenario Outline: Authentication-Web_Login-Login_With_OTP_[WEB]

    Given Open Login page
    And Change language to English

    When Login to the page using user from Excel "<rowindex>" columnName "username"

    Then Wait for element by text "Balance"
    And Assert element by tag "h3" containing text "Balance"

    Examples:
      | rowindex |
      |        1 |


  @Authentication-Web_Login-Login_With_OTP-Invalid_OTP_[WEB]
  Scenario Outline: Authentication-Web_Login-Login_With_OTP-Invalid_OTP_[WEB]

    Given Open Login page
    And Change language to English

    When Click on element by containing class "icon-eye"
    And Enter text "mirko.lekic@ibank" into "Username" input field in preLogin
    And Enter text "147852" into "One-time password" input field in preLogin
    And Click on normalized text "Login to NLB Klik"
    And Assert element by contains text "Credentials you have entered are invalid. Login attempts remaining"
    And Enter text "Automatizacija" into "One-time password" input field in preLogin
#    And Assert element by contains text "Error_Common_DataRequired"
    And Assert element by xPath "//nlb-validation-error" is displayed

    Then Enter text "147852369456987" into "One-time password" input field in preLogin
    And Assert input field "One-time password" in preLogin has 8 characters
    And Enter text "aleksa.vojnovic@ibank" into "Username" input field in preLogin
    And Enter text "147852" into "One-time password" input field in preLogin
    And Click on normalized text "Login to NLB Klik"
    And Assert element by contains text "Error"

    Examples:
      | rowindex |
      |        1 |