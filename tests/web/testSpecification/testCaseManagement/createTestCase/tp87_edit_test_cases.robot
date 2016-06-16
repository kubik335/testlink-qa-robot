*** Settings ***

Documentation  The test case for editing test cases.

Resource       ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Check New Test Suite
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}

Test Teardown  Run keywords         testlink.Go to index page
...             AND                 testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND                 testlink.Check that test has been deleted
...             AND                 Close browser

*** Variables ***
${newTestProjectName}           testProject87
${newTestProjectPrefix}         tp87
${testSuiteName}                tsuite87
${testDescription}              DescriptionOfTest87
${testCaseName}                 tc87
${testCaseNameEdit}             tc87_1

*** Test Cases ***

Edit test case
    [Tags]  controll
    headerPage.Go to Index Page
    desktopPage.Go to Test Specification (mainframe)
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Edit Test Case

