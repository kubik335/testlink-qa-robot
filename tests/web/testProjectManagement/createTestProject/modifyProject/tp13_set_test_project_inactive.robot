*** Settings ***
Documentation  This test case checks validation of setting the project active or inactive.

Resource        ../../../../../resource/testlink.robot

Test Setup  testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
Test Teardown  Delete Test Project  ${newTestProjectName}  ${newtestprojectprefix}


*** Variables ***

${newTestProjectName}  testProject13
${newtestprojectprefix}  tp13


*** Test Cases ***
Set Test Project INACTIVE

    testlink.Click desired project
    testlink.Unselect Checkbox Availibility Active
    testlink.Unactive Test Project by Bulb
    testlink.Check Test Project Is Active



