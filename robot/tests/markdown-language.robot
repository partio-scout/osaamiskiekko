*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Test Setup          Open browser and go to frontend/tietoa
Test Teardown       Close browser

*** Test cases ***

User must be able to change languages in markdown pages
  The page should be in Finnish
  When user click EN
  Then the page should be in English
  When user click SV
  Then the page should be in Swedish
  When user click FI
  Then the page should be in Finnish

*** Keywords ***
Open browser and go to frontend/tietoa
  Open Browser    ${SERVER}tietoa    browser=${BROWSER}    remote_url=${SELENIUM}
  Maximize Browser Window

The page should be in Finnish
  Wait Until Page Contains  Tietoa -sivu

When user click EN
  Click Button  en

Then the page should be in English
  Wait Until Page Contains  Information page

When user click SV
  Click button  sv

Then the page should be in Swedish
  Wait Until Page Contains  Informationssida

When user click FI
  Click Button  fi