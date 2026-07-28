Feature: Templates

  @Payments_Recipient_Template_List_[WEB]
  Scenario Outline: Payments_Recipient_Template_List_[WEB]

    Given Open Login page
    And Change language to English
    And Login to the page using user from Excel "<rowindex>" columnName "username"
    And Wait for element by text "Balance"

    When Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Past payments"
    And Click on normalized text "Templates"
    And Wait for element by tag "nlb-search-box"
    And Remember number of saved templates under key "keyTemplatesAmount"

    And Assert number of elements with attribute "class" and contains value "medium tw-text-gray" is from key "keyTemplatesAmount"
    And Assert number of elements with attribute "class" and contains value "line-clamp-1 ellipsis" is from key "keyTemplatesAmount"
    And Assert number of elements with attribute "class" and contains value "text-gray-100 tw-whitespace-nowrap" is from key "keyTemplatesAmount"
    And Assert number of elements with attribute "class" and contains value "icon-chevron-down" is from key "keyTemplatesAmount"

    And Remember list of elements text with attribute "class" and contains value "medium tw-text-gray" under key "keyRecipientNames"
    And Remember list of elements text with attribute "class" and contains value "line-clamp-1 ellipsis" under key "keyRecipientAccounts"

    And Assert list of elements text with attribute "class" and contains value "callout bold" are sorted by alphabetical order
    And Assert list of elements text with attribute "class" and contains value "medium tw-text-gray" are sorted by alphabetical order

    And Remember prefix of random template name and remember it under key "keySearchNamePrefix"
    And Remember part of random template account number and remember it under key "keyAccountNumberPrefix"
    And Enter text "A" in field by contains id "search-input"
    And Wait for "1" seconds
    And Assert number of elements with attribute "class" and contains value "medium tw-text-gray" is from key "keyTemplatesAmount"
    And Enter text from key "keySearchNamePrefix" in field by contains id "search-input"
    And Wait for "1" seconds
    And Assert elements with attribute "class" and contains value "medium tw-text-gray" contains text from key "keySearchNamePrefix"
    And Click on normalized text "Cancel"
    And Wait for element by tag "section"
    And Enter text from key "keyAccountNumberPrefix" in field by contains id "search-input"
    And Wait for "1" seconds
    And Assert elements with attribute "class" and contains value "line-clamp-1 ellipsis" contains text from key "keyAccountNumberPrefix"
    And Click on normalized text "Cancel"
    And Wait for element by tag "section"
    And Enter text "zzzyyyxxzx" in field by contains id "search-input"
    And Wait for element by contains text "NoResultsAdjustFilter"
    And Assert element by contains text "NoResultsAdjustFilter"
    And Click on normalized text "Cancel"
    And Wait for element by tag "section"
    And Click on element by containing class "icon-chevron-down" with index "1"
    And Wait for element by contains text "Delete"
    And Assert element by contains text "Purpose"
    And Assert element by contains text "Creditor account"
    And Assert element by contains text "Model"
    And Assert element by contains text "Reference number"
    And Assert element by contains text "Recipient name"
    And Assert element by contains text "Address"
    And Assert element by contains text "Edit"
    And Assert element by contains text "Pay"
    And Assert element by contains text "Delete"

    Then Click on tab "Payments" from main sidebar
    And Wait for element by contains text "Domestic payment"
    And Click on normalized text "Domestic payment"
    And Wait for element by contains text "Select from list"
    And Click on normalized text "Select from list"
    And Wait for element by tag "nlb-search-box"
    And Assert elements text with attribute "class" and contains value "clamp-1 ellipsis" with list from key "keyRecipientAccounts"

    Examples:
      | rowindex |
      |        5 |