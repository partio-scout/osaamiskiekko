*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Test Setup          Open browser and go to homepage
Test Teardown       Close browser

*** Variables ***
${SCHOOL}           org1 sillä on pitkä nimi joka ei aina mahdu yhdelle riville_fi
${SCHOOL_FIELD}     xpath://div[@name='search-school-component']
${SCHOOL_ITEM}      ${SCHOOL_FIELD}//div[contains(@class, 'item')]//span[contains(text(), '${SCHOOL}')]

${LEARNING}         org1-comp1_fi
${LEARNING_FIELD}   xpath://div[@name='search-education-component']
${LEARNING_ITEM}    ${LEARNING_FIELD}//div[contains(@class, 'item')]//span[contains(text(), '${LEARNING}')]

*** Test cases ***

User must be able to search for organization and competences
  Given frontpage should be open
  When user types org1 in visible search input
  Then organization option should appear
  When user selects organization
  Then organization org1 should be selected
  And education input field should appear
  When user types org1-comp1 in second input field
  Then the education option should appear
  When user selects education
  Then education org1-comp1 should be selected

*** Keywords ***
Given frontpage should be open
    Location Should Be  ${SERVER}

When user types org1 in visible search input
    Wait Until Page Contains Element    ${SCHOOL_FIELD}
    Click Element    ${SCHOOL_FIELD} 
    Input Text    ${SCHOOL_FIELD}//input    ${SCHOOL}

Then organization option should appear
    Wait Until Page Contains Element    ${SCHOOL_ITEM}

When user selects organization
    Click Element   ${SCHOOL_ITEM}

Then organization org1 should be selected
    Wait Until Element Contains    ${SCHOOL_FIELD}//div[@class='text']    ${SCHOOL}

And education input field should appear
    Page Should Contain Element   ${LEARNING_FIELD}

When user types org1-comp1 in second input field
    Click Element    ${LEARNING_FIELD} 
    Input Text    ${LEARNING_FIELD}//input   ${LEARNING}

Then the education option should appear
    Wait Until Page Contains Element   ${LEARNING_ITEM}

When user selects education
    Click Element   ${LEARNING_ITEM}

Then education org1-comp1 should be selected
    Wait Until Element Contains    ${LEARNING_FIELD}//div[@class='text']    ${LEARNING}
