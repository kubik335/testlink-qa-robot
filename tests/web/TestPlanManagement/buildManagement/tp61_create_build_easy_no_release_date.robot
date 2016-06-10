*** Settings ***

Documentation  The test case for creating build with values without release date and
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

${buildName}  buildName61
${buildDescription}  DescriptionOfBuild61
${TestPlanName}  testPlan61
${newTestProjectName}  testProject61
${newTestProjectPrefix}  tp61
${TestPlanDescription}  DescriptionOfTestPlan61

*** Test Cases ***

Create Build - "Easy" - No release date

    headerPage.Go to index page and change testproject
    testlink.Start creating build with warning
    testlink.Add Details and Finish creating build ${buildName}
    testlink.Check that Build is created ${buildName}

