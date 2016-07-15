*** Settings ***

Documentation  This is the resource file containing all methods based part of desktop which contains header
Library        Selenium2Library

*** Variables ***

${mySettings}               xpath=//a[img[@title="My Settings"]]
${desktop}                  xpath=//img[@title="Project"]
${requirementSpec}          xpath=//img[@title="Requirement Specification"]
${testSpec}                 xpath=//img[@title="Test Specification"]
${testExecution}            xpath=//img[@title="Test Execution"]
${testReports}              xpath=//img[@title="Test Reports"]
${userManagement}           xpath=//img[@title="User Management"]
${events}                   xpath=//img[@title="Events"]
${indexPage}                xpath=//img[@title="logo"]
${testProject}              xpath=//select[@name="testproject"]

*** Keywords ***
I am here
    select frame  titlebar
    wait until page contains element  xpath=//img[@alt="Company logo"]
    wait until page contains element  xpath=//img[@title="My Settings"]
    wait until page contains element  xpath=//img[@title="Logout"]
    wait until page contains element  xpath=//img[@title="Project"]
    wait until page contains element  xpath=//img[@title="Test Specification"]
    wait until page contains element  xpath=//img[@title="User Management"]
    wait until page contains element  xpath=//img[@title="Events"]
    wait until page contains element  targetTestCase
    wait until page contains element  xpath=//img[@title="Search Test Case by ID"]
    wait until page contains element  xpath=//select[@name="testproject"]
    unselect frame

I am here in full
    wait until keyword succeeds  1min  0  headerPage.I am here
    select frame  titlebar
    wait until page contains element  xpath=//img[@title="Requirement Specification"]
    wait until page contains element  xpath=//img[@title="Test Execution"]
    wait until page contains element  xpath=//img[@title="Test Reports"]
    unselect frame

HeaderPage Go to ${link}
    select frame  titlebar
    wait until page contains element  xpath=//img[@title="logo"]
    click element  xpath=//img[@title="logo"]
    unselect frame
    wait until keyword succeeds  1min  0  headerPage.I am here
    select frame  titlebar
    click element  ${link}
    unselect frame

Choose test project from dropdown
    select frame  titlebar
    select from list by label  xpath=//select[@name="testproject"]  ${newTestProjectPrefix}:${newTestProjectName}
    unselect frame

