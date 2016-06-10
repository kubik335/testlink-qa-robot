*** Settings ***

Documentation  The test case for creating build from another existing build(No conflicts).

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Build with name ${buildName}


Test Teardown  Run keywords  testlink.Delete Build ${buildName}
...            AND           testlink.Delete Build ${buildName2}
...            AND           testlink.Delete Test Plan Management  ${TestPlanName}
...            AND           testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser


*** Variables ***

${buildName}  buildName63
${buildName2}  buildName63_1
${buildDescription}  DescriptionOfBuild63
${TestPlanName}  testPlan63
${newTestProjectName}  testProject63
${newTestProjectPrefix}  tp63
${TestPlanDescription}  DescriptionOfTestPlan63

*** Test Cases ***

Create Build - "Easy" - from existing build


    headerPage.Go to index page and change testproject
    testlink.Create ${buildName2} from existing ${buildName}

