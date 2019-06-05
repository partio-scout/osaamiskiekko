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
    Then search should show     org2    org2-comp1

*** Keywords ***

Given frontpage is open
    Location Should Be  ${SERVER}

When user searches for      
    [Arguments]    ${institution}    ${training}
    Wait Until Page Contains Element    search-school
    # Fill search
    Input Text    search-school   ${institution}
    Click Element      xpath://div[@name='search-school-component']//li[contains(@class, 'search-result-item')]//p[contains(text(), '${institution}')]
    Input Text    search-education   ${training}
    Click Element      xpath://div[@name='search-education-component']//li[contains(@class, 'search-result-item')]//p[contains(text(), '${institution}')]
    # Click search result

And accesses crediting page
    [Arguments]    ${creditingId}
    Wait Until Page Contains Element    school-item-${creditingId}
    Click Element    school-item-${creditingId}
    Wait Until Page Contains Element    class:degree-info

And returns to search
    Click Element    xpath://div[@class='footer']//button

Then search should show
    [Arguments]    ${institution}    ${training}
    Textfield Should Contain    search-school    ${institution}
    Textfield Should Contain    search-education    ${training}
