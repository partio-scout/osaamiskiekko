*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Test Setup          Open browser and go to frontend/tietoa
Test Teardown       Close browser

*** Test cases ***

User must 
  The front page should have error message

*** Keywords ***
Open browser and go to frontend/tietoa
  Open Browser    ${SERVER}unknownpage    browser=${BROWSER}    remote_url=${SELENIUM}
  Maximize Browser Window

The front page should have error message
  Wait Until Page Contains  Virhe 404