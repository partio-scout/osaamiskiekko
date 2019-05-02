*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Suite Setup         Set Selenium Timeout    1 minute
Suite Teardown      Set Selenium Timeout    15 seconds
Test Setup          Open browser and go to backend
Test Teardown       Close backend browser

*** Test cases ***

Backend should be open
    Verify backend is running

Backend should be open2
    Verify backend is running

Backend should be open3
    Verify backend is running
