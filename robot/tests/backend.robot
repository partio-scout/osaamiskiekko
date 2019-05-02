*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Test Setup          Open browser and go to backend
Test Teardown       Close browser

*** Test cases ***

Backend should be open
    Verify backend is running

Backend should be open2
    Verify backend is running

Backend should be open3
    Verify backend is running
