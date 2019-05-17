*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Test Setup          Open browser and go to homepage
Test Teardown       Close browser

*** Test cases ***

User must be able to search for organization and competences
  Given frontpage should be open
  When user types partio in visible search input
  Then it should show organization search results
  Given organization search results are visible
  When user clicks organization search result
  Then organization partio should be selected
  And another input field should appear
  When user types partio in second input field
  Then it should show education results
  When user clicks education search result

*** Keywords ***
Given frontpage should be open
    Location Should Be  ${SERVER}

When user types partio in visible search input
    Wait Until Page Contains Element  search-school
    Input Text  search-school   Partio

Then it should show organization search results
    Wait Until Page Contains  Suomen Partiolaiset – Finlands Scouter ry

Given organization search results are visible
    Page Should Contain   Suomen Partiolaiset – Finlands Scouter ry

When user clicks organization search result
    Click Element   1

Then organization partio should be selected
    Textfield Value Should Be  search-school   Suomen Partiolaiset – Finlands Scouter ry

And another input field should appear
    Page Should Contain Element   search-education

When user types partio in second input field
    Input Text  search-education   Partio

Then it should show education results
    Wait Until Page Contains   Partiojohtajan peruskoulutus

When user clicks education search result
    Click Element   1

Then education partiojohtajankoulutus should be selected
    Textfield Value Should Be  search-education   Partiojohtajan peruskoulutus