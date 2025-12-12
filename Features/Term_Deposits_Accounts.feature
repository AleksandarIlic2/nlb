Feature: Term_Deposits_Accounts

  @Term_Deposits_Lists_[WEB]
  Scenario Outline: Term_Deposits_Lists_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Assert that products in my products have loaded

    Then Scroll element by xPath "//div[contains(@class,'heading-5') and normalize-space()='Term deposit amount']/following::span[contains(@class,'tw-pl-1')]" into bottom view
    And Assert amount and currency are displayed by xPaths "(//span[contains(@class,'tw-pl-1')]/preceding-sibling::span)[last()]" and "//div[contains(@class,'heading-5') and normalize-space()='Term deposit amount']/following::span[contains(@class,'tw-pl-1')]"
    And Assert Product number is in BBAN format by xPath "//nlb-heading-text[.//div[contains(text(),'Term deposits')]]/following-sibling::div"
    And Assert Product name is displayed by xPath "(//*[contains(@class, 'heading-3')])[last()]"
    And Assert Product card is clickable by xPath "(//*[contains(@class, 'heading-3')])[last()]"
    And Assert user is redirected to the page by contains URL "TERM_DEPOSIT"

    Examples:
      | rowindex |
      |        1 |
