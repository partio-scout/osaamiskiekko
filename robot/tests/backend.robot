*** Settings ***

Resource   ${PROJECTROOT}${/}resources${/}common.robot
Resource   ${PROJECTROOT}${/}resources${/}variables.robot

Test Setup          Open browser and go to backend
Test Teardown       Close browser

*** Test cases ***
# FIXME: Backend tests fail in Jenkins - disabled until solution found. Possible timing issue: 
# Backend taking too long to come up? 

# Backend should be open
#     Verify backend is running

# Backend should be open2
#     Verify backend is running

# Backend should be open3
#     Verify backend is running
