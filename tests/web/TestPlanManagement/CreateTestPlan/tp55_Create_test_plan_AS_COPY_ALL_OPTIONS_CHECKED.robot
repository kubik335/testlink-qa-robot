*** Settings ***

Documentation  The test case for creating a Test plan using the "create as copy" feature
...            with all checkboxes "checked".

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}


Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser


*** Variables ***

${TestPlanName}  testPlan55
${TestPlanDescription}  DescriptionOfTestPlan55
${newTestProjectName}  testProject55
${newTestProjectPrefix}  tp55
${TestPlanName2}  testPlan55_1

*** Test Cases ***

Create test plan AS COPY ALL OPTIONS CHECKED

    headerPage.Go to index page
    testlink.Click on Test Plan Management
    testlink.Create Test Plan Management AS COPY NOK
    testlink.Create Test Plan Management AS COPY Unselect all checkboxes





