*** Settings ***

Documentation  The test case for deleting Test plan.

Resource    ../../../resource/testlink1.robot

Test Setup  Run keywords    Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         Create test case ${testCaseName} in ${testSuiteName}
...             AND         Create New Version Of TC
...             AND         Create New Test Plan ${TestPlanName}
...             AND         Create New Test Plan ${TestPlanName1}
...             AND         Create Platform ${PlatformName}
...             AND         Add Platform to Test Plan
...             AND         testlink.Add Test Case To the Test Plan
...             AND         Create Build with name ${buildName}
...             AND         Add TC ${testCaseName} to platform ${PlatformName} users ${Username}


Test Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND            close browser

*** Variables ***