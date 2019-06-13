*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Test Setup          Open browser and go to frontend/tietoa
Test Teardown       Close browser

*** Test cases ***

User must be able to navigate in page
  Information page should be displayed
  When user click Osaamiskiekko
  Then front page should be displayed
  When user click Ota yhteyttä
  Then contact form should be displayed
  When user click Tietoa
  Then information page should be displayed
  When user go to Ota yhteyttä -URL
  Then contact form should be displayed

*** Keywords ***
Open browser and go to frontend/tietoa
  Open Browser    ${SERVER}tietoa    browser=${BROWSER}    remote_url=${SELENIUM}
  Maximize Browser Window

Information page should be displayed
  Wait Until Page Contains  Tietoa osaamiskiekosta
  Location Should Be  ${SERVER}tietoa

When user click Osaamiskiekko
  Click Link  Osaamiskiekko

Then front page should be displayed
  Wait Until Page Contains  Osaamiskiekon avulla
  Location Should Be  ${SERVER}

When user click Ota yhteyttä
  Click Link  Ota yhteyttä

Then contact form should be displayed
  Wait Until Page Contains  Ota yhteyttä
  Location Should Be  ${SERVER}otayhteytta

When user click Tietoa
  Click Link  Tietoa

When user go to Ota yhteyttä -URL
  Go To   ${SERVER}otayhteytta
