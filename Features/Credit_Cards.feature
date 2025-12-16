Feature: Credit_Cards

  @Credit_Cards-Header_Display_[WEB]
  Scenario Outline: Credit_Cards-Header_Display_[WEB]
    #C71150

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"
    And Assert that products in my products have loaded

    Then Click on element by containing text "8476"
    And Assert element by contains src "CreditCard-Icon" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "cardName" is displayed
    And Assert PAN card number by containing text "8476"
    And Assert amount and currency are displayed by xPaths "(//div/nlb-amount/div/span)[1]" and "(//div/nlb-amount/div/span)[2]"

    When Click on element by containing text "Details"
    And Assert element by contains src "CreditCard-Icon" is displayed
    And Assert element by contains text from excel "<rowindex>" columnName "cardName" is displayed
    And Assert PAN card number by containing text "8476"
    And Assert amount and currency are displayed by xPaths "(//div/nlb-amount/div/span)[1]" and "(//div/nlb-amount/div/span)[2]"
    And Assert element by xPath "(//*[text() = 'Financial details'])[2]" is displayed
    And Assert element by xPath "(//*[text() = 'Account details'])[2]" is displayed

    Examples:
      | rowindex |
      |        1 |