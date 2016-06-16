*** Settings ***

Documentation  The test case for creating a test case with steps without generation errors or conflicts.

Resource       ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Check New Test Suite
...             AND         testlink.Go to index page

Test Teardown  Run keywords    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             testlink.Check that test has been deleted
...             AND              Close browser

*** Variables ***
${newTestProjectName}           testProject86
${newTestProjectPrefix}         tp86
${testSuiteName}                tsuite86
${testDescription}              testDescription86
${testCaseName}                 tc86



*** Test Cases ***

Create Test Case
    [Tags]  controll
    desktopPage.Go to Test Specification (mainframe)
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Select test suite ${testSuiteName} node
    testlink.Start Creating Test Case
    testlink.Fill informations test case and create
    testlink.Create Step in test case: ${testCaseName}
    testSpecificationPage.Add Step after created first step
    #testSpecificationPage.Click on save & exit


