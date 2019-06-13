*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Test Setup          Open browser and go to frontend/tietoa
Test Teardown       Close browser

*** Test cases ***

User must be able to change languages in markdown pages
  The page should be in Finnish
  When user set language to    en
  Then the page should be in English
  When user set language to    sv
  Then the page should be in Swedish
  When user set language to    fi
  Then the page should be in Finnish

*** Keywords ***
Open browser and go to frontend/tietoa
  Open Browser    ${SERVER}tietoa    browser=${BROWSER}    remote_url=${SELENIUM}
  Maximize Browser Window

When user set language to
  [Arguments]    ${languagecode}
  Click Button    ${languagecode}

The page should be in Finnish
  Wait Until Page Contains  Tietoa osaamiskiekosta

Then the page should be in English
  Wait Until Page Contains  Information

Then the page should be in Swedish
  Wait Until Page Contains  Information
