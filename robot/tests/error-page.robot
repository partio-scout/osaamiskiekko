*** Settings ***

Resource   ${CURDIR}/../resources/common.robot

Test Setup          Open browser and go to frontend/tietoa
Test Teardown       Close browser

*** Test cases ***

Frontpage should show error
  The front page should have error message

*** Keywords ***
Open browser and go to frontend/tietoa
  Open browser and go to homepage
  Go to  ${SERVER}unknownpage

The front page should have error message
  Wait Until Page Contains  Virhe: 404