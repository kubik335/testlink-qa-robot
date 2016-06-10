*** Settings ***

Documentation  The test case for deleting Build.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Build with name ${buildName}

Test Teardown  Run keywords  testlink.Delete Test Plan Management  ${TestPlanName}
...            AND           testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser







*** Variables ***

${buildName}  buildName66
${buildDescription}  DescriptionOfBuild66
${TestPlanName}  testPlan66
${newTestProjectName}  testProject66
${newTestProjectPrefix}  tp66
${TestPlanDescription}  DescriptionOfTestPlan66

*** Test Cases ***

Delete Build
    testlink.Delete build ${buildName}