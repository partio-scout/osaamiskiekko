*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Test Setup          Open browser and go to backend
Test Teardown       Close backend browser

*** Test cases ***

Backend should be open
    Verify backend is running