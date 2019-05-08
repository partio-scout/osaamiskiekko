*** Settings ***

Library     Selenium2Library  timeout=15

Variables   ./variables.py

Documentation   Test suite should always import only one resource file.
...  Thus, ideally your resource files create a tree structure while
...  importing. This resource file should be the common root for them all where
...  project-wide keywords, imports, and other settings reside.

*** Keywords ***

Open browser and go to homepage
  Open Browser    ${SERVER}    browser=${BROWSER}    remote_url=${SELENIUM}
  Maximize Browser Window

Open browser and go to backend
  Open Browser    ${SERVER}api    browser=${BROWSER}    remote_url=${SELENIUM}
  Maximize Browser Window

Close browser
  Close All Browsers

Verify frontend is running
  Location should be          ${SERVER}
  Wait Until Page Contains    Osaamiskiekko

Verify backend is running
    Go to                       ${SERVER}api/Academies
    Wait Until Page Contains    Forbidden

# Login
#   [Arguments]    ${email}    ${password}
#   Input Text                  name=email         ${email}
#   Input Text                  name=password      ${password}
#   Submit Form

# Click Button With Span  [Arguments]  ${locator}
#   Click Button  //button[contains(text(), '${locator}')]

