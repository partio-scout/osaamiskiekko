*** Settings ***

Resource   ${CURDIR}/../resources/common.robot

Test Setup          Open browser and go to homepage
Test Teardown       Close browser

*** Test cases ***

User must be able to change languages
  The front page should be in Finnish
  When user click EN
  Then the front page should be in English
  When user click SV
  Then the front page should be in Swedish
  When user click FI
  Then the front page should be in Finnish

*** Keywords ***

The front page should be in Finnish
  Wait Until Page Contains  Valitse järjestö tai oppilaitos

When user click EN
  Click Button  en

Then the front page should be in English
  Wait Until Page Contains  elect organisation or education institute

When user click SV
  Click button  sv

Then the front page should be in Swedish
  Wait Until Page Contains  Välj organisation eller läroanstalt

When user click FI
  Click Button  fi