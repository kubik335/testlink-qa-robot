*** Settings ***
Documentation  A test case for assigning roles to existing users.

Resource       ../../../../resource/testlink.robot


Test Setup  Run keywords        testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND             headerPage.Go to index page and change testproject
...             AND             testlink.Create New Test Plan ${TestPlanName}
...             AND             headerPage.Go to index page and change testproject
...             AND             testlink.Create and check role ${role} in user management
...             AND             headerPage.Go to index page

Test Teardown  Run keywords     headerPage.Go to User Management
...             AND             userManagement.Delete role ${role}
...             AND             testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close all browsers


*** Variables ***
${role}                     novaRole
${newTestProjectName}       testProject102
${newTestProjectPrefix}     tp102
${TestPlanName}                     testPlan102
${TestPlanDescription}              DescriptionOfTestPlan102

*** Test Cases ***

Assign Test Project and Test Plan roles
    headerPage.Go to User Management
    userManagement.Click bookmark Assign Test Project roles
    userManagement.Change user role in test project
    userManagement.Click bookmark Assign Test Plan roles
    userManagement.Change user role in test plan



