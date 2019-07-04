*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Test Setup          Open browser and go to homepage
Test Teardown       Close browser

*** Test cases ***

Search remembers selections after changing page
    Given frontpage is open
    When user searches for      org2    org2-comp1
    And accesses crediting page    10
    And returns to search
    Then search should show     org2    org2-comp1    10

*** Keywords ***

Given frontpage is open
    Location Should Be  ${SERVER}

When user searches for      
    [Arguments]    ${institution}    ${training}
    Wait Until Page Contains Element    xpath://div[@name='search-school-component']
    Click Element    xpath://div[@name='search-school-component']
    Input Text    xpath://div[@name='search-school-component']//input   ${institution}
    Click Element      xpath://div[@name='search-school-component']//div[contains(@class, 'item')]//span[contains(text(), '${institution}')]
    Click Element    xpath://div[@name='search-education-component']
    Input Text    xpath://div[@name='search-education-component']//input   ${training}
    Click Element      xpath://div[@name='search-education-component']//div[contains(@class, 'item')]//span[contains(text(), '${training}')]

And accesses crediting page
    [Arguments]    ${creditingId}
    Wait Until Page Contains Element    school-item-${creditingId}
    Click Element    school-item-${creditingId}
    Wait Until Page Contains Element    class:degree-info

And returns to search
    Click Element    xpath://main[@class='content']//div[@class='footer']//button

Then search should show
    [Arguments]    ${institution}    ${training}    ${creditingId}
    Wait Until Page Contains Element    xpath://div[@name='search-education-component']
    Element Should Contain    xpath://div[@name='search-school-component']//div[@class='text']    ${institution}
    Element Should Contain    xpath://div[@name='search-education-component']//div[@class='text']    ${training}
    Page Should Contain Element    school-item-${creditingId}
