*** Settings ***

Documentation  The test case for creating build with values with release date and
...            that could not generate error/conflicts while creating.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}



Test Teardown  Run keywords  testlink.Delete Build ${buildName}
...            AND           testlink.Delete Test Plan Management  ${TestPlanName}
...            AND           testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser


*** Variables ***

${buildName}  buildName62
${buildDescription}  DescriptionOfBuild62
${TestPlanName}  TestplanNumberOne
${newTestProjectName}  testProject62
${newTestProjectPrefix}  tp62
${TestPlanDescription}  DescriptionOfTestPlan62

*** Test Cases ***
Test Case Create Build "EASY" With Release Date
    headerPage.Go to index page and change testproject
    testlink.Start creating build with warning
    testlink.Create Build With Release Date And Save
    testlink.Check that Build is created ${buildName}
