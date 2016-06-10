*** Settings ***

Documentation  A test case for creating a Test plan using the "create as copy" feature.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         headerPage.Go to index page


Test Teardown  Run keywords    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             close browser


*** Variables ***

${newTestProjectName}  testProject54
${newTestProjectPrefix}  tp54
${newTestProjectDescription}  DesctiptioneOfTestProject54
${TestPlanName}  testPlan54
${TestPlanName2}  testPlan54_1
${TestPlanDescription}  DescriptionOfTestPlan54

*** Test Cases ***

Create test plan AS COPY

     testlink.Create Test Plan Management AS COPY





