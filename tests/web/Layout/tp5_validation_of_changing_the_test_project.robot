*** Settings ***
Documentation  This test case is used for validation of changing the Test Project.

Resource       ../../../resource/testlink.robot

Test Setup  Run keywords        testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND             testlink.Go to index page
...             AND             testlink.Create TP ${newTestProjectName1} ${newTestProjectPrefix1}

Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName1}  ${newTestProjectPrefix1}
...             AND             testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser

*** Variables ***
${newTestProjectName}               testProject5
${newTestProjectPrefix}             tp5
${newTestProjectName1}               testProject5_1
${newTestProjectPrefix1}             tp5_1

*** Test Cases ***

Validation of changing the Test Project
    headerPage.Go to index page and change testproject

