*** Settings ***

Resource   ${CURDIR}/../resources/common.robot

Test Setup          Open browser and go to homepage
Test Teardown       Close browser

*** Test cases ***

Frontend should be open
    Verify frontend is running