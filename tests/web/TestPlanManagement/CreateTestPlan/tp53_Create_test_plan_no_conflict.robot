*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot
Test Setup      testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             testlink.Delete Test Plan Management  ${TestPlanName}
...             AND             Close browser


*** Variables ***

${TestPlanName}  testPlan53
${TestPlanDescription}  DescriptionOfTestPlan53
${newTestProjectName}           testProject53
${newTestProjectPrefix}         tp53
${newTestProjectDescription}    Description53

*** Test Cases ***

Create new test plan

     testlink.Login as admin correct
     testlink.Create New Test Plan ${TestPlanName}
     #testlink.Create New Test Plan ${TestPlanName} ---commented by mohammed
     #testlink.Login as admin correct
     #loginPage.Check there is no warning about login
     #assignRolesForTP.Assign Roles for TP
