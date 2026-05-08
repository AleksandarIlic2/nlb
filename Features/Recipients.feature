Feature: Recipients

  @Payments_Recipient-Save_Recipient_[WEB]
  Scenario Outline: Payments_Recipient-Save_Recipient_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Click on element by aria label "User profile"
    And Remember full name of user from dashboard under key "fullNameKey"
    And Click on element by text "Payments"
    And Click on element by text "Domestic payment"
    And Assert today date in Payment date in payment review
    And Assert element by class "icon-calendar-today"

    When Enter text "205-9001010537788-94" in "Account number" input field and remember under key "accountNumberKey"
    And Enter text "Enil" in "Name" input field and remember under key "nameKey"
    And Enter text "Kaludjerica" in "street" input field and remember under key "streetKey"
    And Enter text "Beograd" in "City" input field and remember under key "cityKey"
    And Enter text "1" in "Payment amount" input field and remember under key "paymentAmountKey"
    And Enter text "75" in "Reference number" input field and remember under key "referenceNumberKey"
    And Assert checkbox "Save recipient" is checked "false"
    And Click on element by containing text "Save recipient"
    And Assert checkbox "Save recipient" is checked "true"
    And Enter random purpose into label with text "Purpose" with following sibling "div" that has descendant "input" and remember it under key "purposeKey"
    And Click on button with type "submit"

    Then Wait for element by contains text "Payment amount"
    And Assert payment amount under key is "paymentAmountKey" is displayed
    And Assert element by contains text "Fee"
    And Assert contains text under key "accountNumberKey" is displayed
    And Assert contains text under key "nameKey" is displayed
    And Assert contains text under key "streetKey" is displayed
    And Assert contains text under key "streetKey" is displayed
    And Assert contains text under key "referenceNumberKey" is displayed
    And Assert contains text under key "purposeKey" is displayed
    And Wait for "10" seconds

    Examples:
      | rowindex |
      |        4 |


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
#    And Wait for element by text " Confirm "
#    And Click on element by text " Confirm "
#    And Click on element by text " Confirm "
#    And Click on element by text " Confirm "
#    And Click on element by text " Confirm "
    And Wait for element by text "Success"
    And Assert element by text "Success"

    #URADI PETI KORAK U TESTU KADA SPUSTE PAYMENT EXECUTION STATUS

    Then Click on element by containing text "Recipients"
    And Wait for "10" seconds
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

    And Wait for "10" seconds
    And Click on element by containing class "tw-flex tw-items-center tw-justify-center tw-cursor-pointer" with index "1"
    #And Click on element by xpath ""
    And Assert element by text "Delete "
    And Wait for element by text "Edit"
    And Assert element by text "Edit"
    And Click on element by text "Edit"

    Then Delete text in field by xPath "//label[contains(text(), 'name')]/following-sibling::div//input"
    And Assert element by contains text " First and last name / Company name is required "
    And Click on element by text "Save"
    And Assert element by contains text " First and last name / Company name is required "
    And Click on element by containing text "Save"

    #And Assert element by contains text "name is required"
    #NE IZLAZI GRESKA KADA AUTOMATIZUJEM APLIKACIJU. VIDI ZASTO I RESI - TREBALO BI DA JE RESENO, PROVERITI SA ALEKSOM

    Examples:
      | rowindex |
      |        1 |

  @Payments_Recipient-Edit_Recipient-Edit_Account_number-invalid_[WEB]
  Scenario Outline: Payments_Recipient-Edit_Recipient-Edit_Account_number-invalid_[WEB]


    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    And Click on tab "Recipients" from main sidebar
    And Click on element by containing class "tw-flex tw-items-center tw-justify-center tw-cursor-pointer" with index "1"
   # And Click on element by containing text "205-9001020797842-69"
    And Assert element by text "Delete "
    And Assert element by text "Edit"

    Then Click on element by text "Edit"
    And Assert element by text "Account number" can not be edited



    Examples:
      | rowindex |
      |        1 |

  @Payments_Recipient-Update_Recipient-Update_Account_number_[WEB]
  Scenario Outline: Payments_Recipient-Update_Recipient-Update_Account_number_[WEB]


    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"

    And Click on element by containing text "Pay or transfer"
    And Click on element by tag "i" contains class "icon-recipients-list"
    And Click on element by containing text "340-0000032535954-64"
    And Remember recipient number and name
    And Change input in label "Account number" to "205900102079784269"
    And Enter amount "100"
    And Click on element by containing text "Confirm"
    And Click on element by containing text "Confirm"

    And Click on tab "Recipients" from main sidebar
    And Assert that recipient has same accNumber



    Examples:
      | rowindex |
      |        1 |