Feature: Dashboard

  @General-Dashboard-Quick_Links_[WEB]
  Scenario Outline: General-Dashboard-Quick_Links_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    When Wait for element by text "Pay or transfer"

    Then Assert sidebar is displayed by contains class "3xl:tw-min-w-sidebarNavigation"
    And Assert notification bell at the right top corner of the screen
    And Assert user profile icon at the right top corner of the screen
    Examples:
      | rowindex |
      |        1 |