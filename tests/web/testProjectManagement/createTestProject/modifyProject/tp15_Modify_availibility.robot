*** Settings ***
Documentation  A test case for changing the project availibility
Resource  ../../../../../resource/testlink.robot
Test Setup  Run Keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject

Test Teardown  Run Keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...                 AND      Close browser


*** Variables ***

${newTestProjectName}       testProject15
${newTestProjectPrefix}     tp15


*** Test Cases ***

Change Project Availibility

    testlink.Go to Test Project Management
    testlink.Click desired project
    testlink.Unselect Checkbox Availibility Active
    testlink.Check Test Project Is Inactive