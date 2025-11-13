Feature: Product_Summary

@Product_Summary_Favourite_account_[WEB]
Scenario Outline: Product_Summary_Favourite_account_[WEB]

  Given Open Login page
  And Change language to English
  And Login to the page using user from Excel "<rowindex>" columnName "username"
  When Wait for element by text "Pay or transfer"

  #User is logged into aplication and clicks on the My Products page frome the menu
  When Click on tab "My products" from main sidebar
  #User is looking at the page
  And Wait for element by text "Edit list"
  Then Assert element by class "button-bold" and contains text "Edit list"
  #User clicks on button for Edit product view
  And Click on element by text "Edit list"
  And Wait for element by class "icon-eye"
  #User clicks on option Set favorite account
  And Click on element by text "Set favorite account"
  And Wait for element by text " Apply "
  Then Assert element by class "tw-items-center" and contains text "Apply"
  #User choose account

  #And click Radio Button By Account "205-9031004417882-84"
  And Click Radio Button with index "favorite_acc"
  #User clicks on Apply button
  And Click on element by text " Apply "
  And Wait for element by text "Success"
  And Assert element by text "Success"
  #Assert first element
  And Assert for first element in product screen
  #And Assert for first element in product screen "205-9031004417882-84"

Examples:
| rowindex |
|        1 |