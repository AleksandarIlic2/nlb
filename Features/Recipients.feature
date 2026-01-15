Feature: Recipients

  @Payments_Recipient-Save_Recipient_[WEB]
  Scenario Outline: Payments_Recipient-Save_Recipient_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on element by text "Pay or transfer"
    And Enter text "265111031234567824" in field by xPath "//label[text()='Account number']/following-sibling::div//input"
    And Enter text "Mika Mikic" in field by xPath "//label[contains(text(), 'name')]/following-sibling::div//input"
    And Enter text "Bulevar 11" in field by xPath "//label[contains(text(), 'Street')]/following-sibling::div//input"
    And Enter text "Beograd" in field by xPath "//label[text()='City']/following-sibling::div//input"
    And Enter text "100" in field by xPath "//label[text()='Payment amount ']/following-sibling::div//input"
    And Click on element by text "Save recipient "

    Then Click on element by text " Confirm "
    And Click on element by text " Confirm "
    And Wait for element by text " Confirm "
    And Click on element by text " Confirm "
    And Click on element by text " Confirm "
    And Click on element by text " Confirm "
    And Wait for element by text "Success"
    And Assert element by text "Success"

#    ODRADI POSLEDNJA DVA KORAKA KADA RESE VREME ZA SUCCESS PROZOR

    Examples:
      | rowindex |
      |        1 |


  @Payments_Recipient-Delete_Recipient_[WEB]
  Scenario Outline: Payments_Recipient-Delete_Recipient_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on element by text "Recipients"
    And Click on element by xpath "(//*[contains(@class, 'justify-center tw-cursor')])[2]"
    And Assert element by text "Delete "
    And Assert element by text "Edit"
    And Click on element by text "Delete "
    And Assert element by text "Delete recipient"
    And Assert element by contains text "Are you sure you want to delete this recipient?"

    Then Click on element by text "Cancel"
    And Click on element by text "Delete "
    And Click on element by text "Delete"

    Examples:
      | rowindex |
      |        1 |


  @Payments_Recipient-Update_Recipient_[WEB]
  Scenario Outline: Payments_Recipient-Update_Recipient_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on element by text "Pay or transfer"
    And Click on element by text "Select from list "
    And Click on element by xpath "(//nlb-contact-item)[2]"
    And Enter text "koar tgr" in field by xPath "//label[contains(text(), 'name')]/following-sibling::div//input" and remember under key "nameKey"
    And Enter text "kaludjerica 30" in field by xPath "//label[contains(text(), 'Street')]/following-sibling::div//input" and remember under key "streetKey"
    And Enter text "niš" in field by xPath "//label[text()='City']/following-sibling::div//input" and remember under key "cityKey"
    And Enter text "100" in field by xPath "//label[text()='Payment amount ']/following-sibling::div//input"
    And Click on element by text "Save recipient "

    And Click on element by text " Confirm "
    And Click on element by text " Confirm "
    And Wait for element by text " Confirm "
    And Click on element by text " Confirm "
    And Click on element by text " Confirm "
    And Click on element by text " Confirm "
    And Click on element by text " Confirm "
    And Wait for element by text "Success"
    And Assert element by text "Success"

    #URADI PETI KORAK U TESTU KADA SPUSTE PAYMENT EXECUTION STATUS

    Then Click on element by containing text "Recipients"
    And Click on recipient name by key "nameKey"
    And Assert recipient name equals remembered key "nameKey"
    And Assert recipient street equals remembered key "streetKey"
    And Assert recipient city equals remembered key "cityKey"

    Examples:
      | rowindex |
      |        1 |


  @Payments_Recipient-Edit_Recipient-Invalid_[WEB]
  Scenario Outline: Payments_Recipient-Edit_Recipient-Invalid_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    When Click on element by text "Recipients"
    And Click on element by xpath "(//*[contains(@class, 'justify-center tw-cursor')])[2]"
    And Assert element by text "Delete "
    And Assert element by text "Edit"
    And Click on element by text "Edit"

    Then Delete text in field by xPath "//label[contains(text(), 'name')]/following-sibling::div//input"
    And Click on element by text "City"
    And Click on element by text "Save"
    And Assert element by contains text "name is required"
    #NE IZLAZI GRESKA KADA AUTOMATIZUJEM APLIKACIJU. VIDI ZASTO I RESI

    Examples:
      | rowindex |
      |        1 |