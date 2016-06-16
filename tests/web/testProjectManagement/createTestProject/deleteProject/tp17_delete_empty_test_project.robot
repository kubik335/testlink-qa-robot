*** Settings ***
Documentation  The test case for deleting a test projects that has NOTHING INSIDE.

Resource       ../../../../../resource/testlink.robot

Test Setup  testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
Test Teardown  close browser

*** Variables ***
${newTestProjectName}  testProject17
${newTestProjectPrefix}  tp17

*** Test Cases ***
Delete Test Project

    #testlink.Login as admin correct
    testlink.Delete empty test project
    testlink.Check that test has been deleted
