*** Settings ***
Documentation  A test case for creating test project and unchecking checkboxes, such as "Enhanced features",
...            "Issue Tracker Management", "Availability".

Resource       ../../../../../resource/testlink.robot

Test Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser

*** Variables ***
${newTestProjectName}  testProject11
${newTestProjectPrefix}  tp11

*** Test Cases ***

Create new Test Project with enhanced features

    testlink.Login as admin correct
    testlink.Start creating new test project (enchanced features)
    testlink.Fill information to create test (enchanced feautures)
    testlink.Submit and check new test project