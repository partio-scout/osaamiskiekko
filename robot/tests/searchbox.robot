*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Test Setup          Open browser and go to homepage
Test Teardown       Close browser

*** Test cases ***

User must be able to search for organization and competences
  Given frontpage should be open
  When user types org1 in visible search input
  Then it should show organization search results
  Given organization search results are visible
  When user clicks organization search result
  Then organization org1 should be selected
  And another input field should appear
  When user types org1-comp1 in second input field
  Then it should show education results
  When user clicks education search result
  Then education org1-comp1 should be selected

*** Keywords ***
Given frontpage should be open
    Location Should Be  ${SERVER}

When user types org1 in visible search input
    Wait Until Page Contains Element  search-school
    Input Text  search-school   org1

Then it should show organization search results
    Wait Until Page Contains  org1 sillä on pitkä nimi joka ei aina mahdu yhdelle riville_fi

Given organization search results are visible
    Page Should Contain   org1 sillä on pitkä nimi joka ei aina mahdu yhdelle riville_fi

When user clicks organization search result
    Click Element   4

Then organization org1 should be selected
    Textfield Should Contain  search-school   org1 sillä on pitkä nimi joka ei aina mahdu yhdelle riville_fi

And another input field should appear
    Page Should Contain Element   search-education

When user types org1-comp1 in second input field
    Input Text  search-education   org1-comp1

Then it should show education results
    Wait Until Page Contains   org1-comp1_fi

When user clicks education search result
    Click Element   6

Then education org1-comp1 should be selected
    Textfield Should Contain  search-education   org1-comp1_fi
