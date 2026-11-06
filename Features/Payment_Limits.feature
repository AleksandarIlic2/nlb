Feature: Payment_Limits

  @View/Edit_User_Data_Personal_Data_Change_Limit_Single_Transaction_[WEB]
  Scenario Outline: View/Edit_User_Data_Personal_Data_Change_Limit_Single_Transaction_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on element by aria label "User profile"
    And Click on element by containing text "Settings"
    And Wait for element by contains text "Change limit"
    And Wait for element by contains text "Change limit"
    And Click on element by containing class "icon-edit"

    And Enter text "1000" in Change limit "Single transaction limit" label and remember it under key "keySingleLimit"
    And Remember text from "Daily transaction limit" label under key "keyDailyLimit"
    And Remember text from "Monthly transaction limit" label under key "keyMonthlyLimit"
    And Assert list of elements by contains aria label "RSD" has 3 elements
    And Assert element by contains text "Cancel"
    And Assert element by contains text "Save"
    And Click on element by containing text "Save"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "3.00" and currency "RSD" with message "Success"

    And Assert element with text "Single transaction limit" with following sibling contains text under key "keySingleLimit" in Change limit
    And Assert element with text "Daily transaction limit" with following sibling contains text under key "keyDailyLimit" in Change limit
    And Assert element with text "Monthly transaction limit" with following sibling contains text under key "keyMonthlyLimit" in Change limit

    And Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Recipient"
    And Click on normalized text "Select from list"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    And Click on normalized text "Select recipient"
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Wait for "2" seconds
    And Click on first recipient
    And Enter text "1001" into Payment amount input field and remember it under key "keyAmount"
    And Click on element by containing text "Confirm"
    And Wait for element by contains text "Error"
    And Assert element by contains class "icon-alert"
    And Assert element by contains text "Transaction limit exceeded"
    And Assert element by contains text "OK"
    And Click on element by containing text "OK"
    And Enter text "100" into Payment amount input field and remember it under key "keyAmount"
    And Click on element by containing text "Confirm"
    And Wait for element by contains text "Fee"
    And Assert element with text "Payment amount" with following sibling contains text under key "keyAmount"

    And Click on element by aria label "User profile"
    And Click on element by containing text "Settings"
    And Wait for element by contains text "Change limit"
    And Wait for element by contains text "Change limit"
    And Click on element by containing class "icon-edit"
    And Enter text "300000" in Change limit "Single transaction limit" label and remember it under key "keySingleLimit"
    And Assert element with text "Daily transaction limit" with following sibling contains text under key "keyDailyLimit" in Change limit
    And Assert element with text "Monthly transaction limit" with following sibling contains text under key "keyMonthlyLimit" in Change limit
    And Click on element by containing text "Save"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "3.00" and currency "RSD" with message "Success"

    And Assert element with text "Single transaction limit" with following sibling contains text under key "keySingleLimit" in Change limit
    And Assert element with text "Daily transaction limit" with following sibling contains text under key "keyDailyLimit" in Change limit
    And Assert element with text "Monthly transaction limit" with following sibling contains text under key "keyMonthlyLimit" in Change limit

    Then Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Recipient"
    And Click on normalized text "Select from list"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    And Click on normalized text "Select recipient"
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Wait for "2" seconds
    And Click on first recipient
    And Enter text "1999" into Payment amount input field and remember it under key "keyAmount"
    And Click on element by containing text "Confirm"
    And Wait for element by contains text "Fee"
    And Assert element by contains text "Fee"

    Examples:
      | rowindex |
      |        1 |


  @View/Edit_User_Data_Personal_Data_Change_Limit_Daily_Transaction_[WEB]
  Scenario Outline: View/Edit_User_Data_Personal_Data_Change_Limit_Daily_Transaction_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on element by aria label "User profile"
    And Click on element by containing text "Settings"
    And Wait for element by contains text "Change limit"
    And Wait for element by contains text "Change limit"
    And Click on element by containing class "icon-edit"

    And Enter text "1000" in Change limit "Daily transaction limit" label and remember it under key "keyDailyLimit"
    And Click on element by containing text "Save"
    And Assert element by contains text "Transaction limit cannot be higher than Daily limit"
    And Click on tab "My NLB" from main sidebar
    And Wait for element by text "Pay or transfer"
    And Click on element by aria label "User profile"
    And Click on element by containing text "Settings"
    And Wait for element by contains text "Change limit"
    And Wait for element by contains text "Change limit"
    And Click on element by containing class "icon-edit"

    And Enter text "2000" in Change limit "Single transaction limit" label and remember it under key "keySingleLimit"
    And Enter text "2000" in Change limit "Daily transaction limit" label and remember it under key "keyDailyLimit"
    And Click on element by xpath "//*[contains(@class, 'tw-bg-primaryColor') and normalize-space(.)='Save']"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "3.00" and currency "RSD" with message "Success"
    And Assert element with text "Single transaction limit" with following sibling contains text under key "keySingleLimit" in Change limit
    And Assert element with text "Daily transaction limit" with following sibling contains text under key "keyDailyLimit" in Change limit

    And Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Recipient"
    And Click on normalized text "Select from list"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    And Click on normalized text "Select recipient"
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Wait for "2" seconds
    And Click on first recipient
    And Enter text "2001" into Payment amount input field and remember it under key "keyAmount"
    And Click on element by containing text "Confirm"
    And Wait for element by contains text "Error"
    And Assert element by contains class "icon-alert"
    And Assert element by contains text "Transaction limit exceeded"
    And Assert element by contains text "OK"
    And Click on element by containing text "OK"
    And Enter text "1200" into Payment amount input field and remember it under key "keyAmount"
    And Click on element by containing text "Confirm"
    And Wait for element by contains text "Fee"
    And Assert element by contains text "Fee"

    And Click on element by aria label "User profile"
    And Click on element by containing text "Settings"
    And Wait for element by contains text "Change limit"
    And Wait for element by contains text "Change limit"
    And Click on element by containing class "icon-edit"
    And Enter text "300000" in Change limit "Daily transaction limit" label and remember it under key "keyDailyLimit"
    And Enter text "300000" in Change limit "Single transaction limit" label and remember it under key "keySingleLimit"
    And Assert element with text "Single transaction limit" with following sibling contains text under key "keySingleLimit" in Change limit
    And Assert element with text "Daily transaction limit" with following sibling contains text under key "keyDailyLimit" in Change limit
    And Click on element by xpath "//*[contains(@class, 'tw-bg-primaryColor') and normalize-space(.)='Save']"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "3.00" and currency "RSD" with message "Success"

    Then Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Recipient"
    And Click on normalized text "Select from list"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    And Click on normalized text "Select recipient"
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Wait for "2" seconds
    And Click on first recipient
    And Enter text "2999" into Payment amount input field and remember it under key "keyAmount"
    And Click on element by containing text "Confirm"
    And Wait for element by contains text "Fee"
    And Assert element by contains text "Fee"

    Examples:
      | rowindex |
      |        1 |


  @View/Edit_User_Data_Personal_Data_Change_Limit_Monthly_Transaction_[WEB]
  Scenario Outline: View/Edit_User_Data_Personal_Data_Change_Limit_Monthly_Transaction_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Pay or transfer"

    When Click on element by aria label "User profile"
    And Click on element by containing text "Settings"
    And Wait for element by contains text "Change limit"
    And Wait for element by contains text "Change limit"
    And Click on element by containing class "icon-edit"

    And Enter text "1000" in Change limit "Daily transaction limit" label and remember it under key "keyDailyLimit"
    And Click on element by containing text "Save"
    And Assert element by contains text "Transaction limit cannot be higher than Daily limit"
    And Enter text "500" in Change limit "Monthly transaction limit" label and remember it under key "keyMonthlyLimit"
    And Click on element by containing text "Save"
    And Assert element by contains text "Transaction limit cannot be higher than Daily limit"
    And Assert element by contains text "Daily limit cannot be higher than Monthly limit!"
    And Click on tab "My NLB" from main sidebar
    And Wait for element by text "Pay or transfer"
    And Click on element by aria label "User profile"
    And Click on element by containing text "Settings"
    And Wait for element by contains text "Change limit"
    And Wait for element by contains text "Change limit"
    And Click on element by containing class "icon-edit"

    And Enter text "2000" in Change limit "Single transaction limit" label and remember it under key "keySingleLimit"
    And Enter text "2000" in Change limit "Daily transaction limit" label and remember it under key "keyDailyLimit"
    And Enter text "2000" in Change limit "Monthly transaction limit" label and remember it under key "keyMonthlyLimit"
    And Click on element by xpath "//*[contains(@class, 'tw-bg-primaryColor') and normalize-space(.)='Save']"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "3.00" and currency "RSD" with message "Success"
    And Assert element with text "Single transaction limit" with following sibling contains text under key "keySingleLimit" in Change limit
    And Assert element with text "Daily transaction limit" with following sibling contains text under key "keyDailyLimit" in Change limit
    And Assert element with text "Monthly transaction limit" with following sibling contains text under key "keyMonthlyLimit" in Change limit

    And Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Recipient"
    And Click on normalized text "Select from list"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    And Click on normalized text "Select recipient"
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Wait for "2" seconds
    And Click on first recipient
    And Enter text "2001" into Payment amount input field and remember it under key "keyAmount"
    And Click on element by containing text "Confirm"
    And Wait for element by contains text "Error"
    And Assert element by contains class "icon-alert"
    And Assert element by contains text "Transaction limit exceeded"
    And Assert element by contains text "OK"
    And Click on element by containing text "OK"
    And Enter text "1200" into Payment amount input field and remember it under key "keyAmount"
    And Click on element by containing text "Confirm"
    And Wait for element by contains text "Fee"
    And Assert element by contains text "Fee"

    And Click on element by aria label "User profile"
    And Click on element by containing text "Settings"
    And Wait for element by contains text "Change limit"
    And Wait for element by contains text "Change limit"
    And Click on element by containing class "icon-edit"
    And Enter text "600000" in Change limit "Monthly transaction limit" label and remember it under key "keyMonthlyLimit"
    And Enter text "300000" in Change limit "Daily transaction limit" label and remember it under key "keyDailyLimit"
    And Enter text "300000" in Change limit "Single transaction limit" label and remember it under key "keySingleLimit"
    And Assert element with text "Single transaction limit" with following sibling contains text under key "keySingleLimit" in Change limit
    And Assert element with text "Daily transaction limit" with following sibling contains text under key "keyDailyLimit" in Change limit
    And Assert element with text "Monthly transaction limit" with following sibling contains text under key "keyMonthlyLimit" in Change limit
    And Click on element by xpath "//*[contains(@class, 'tw-bg-primaryColor') and normalize-space(.)='Save']"
    And Check if authorization is needed and complete payment with account bban from Excel "<rowindex>" columnName "current_account_1_bban" amount "3.00" and currency "RSD" with message "Success"

    Then Click on tab "Payments" from main sidebar
    And Wait for first past payment
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Recipient"
    And Click on normalized text "Select from list"
    And Assert "input" field with placeholder "Type here to search"
    And Assert element by contains text "Total number of saved templates:"
    And Click on normalized text "Select recipient"
    And Assert element by contains class "flex tw-w-full tw-flex"
    And Wait for "2" seconds
    And Click on first recipient
    And Enter text "2999" into Payment amount input field and remember it under key "keyAmount"
    And Click on element by containing text "Confirm"
    And Wait for element by contains text "Fee"
    And Assert element by contains text "Fee"

    Examples:
      | rowindex |
      |        1 |