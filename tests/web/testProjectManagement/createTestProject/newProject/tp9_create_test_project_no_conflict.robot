*** Settings ***
Documentation  A test case for creating a test project with all required information,
...            without creating any conflict (uses a test project name not present on system,
...            use a PREFIX not present on system).

Resource       ../../../../../resource/testlink.robot

Test Setup  testlink.Login as admin correct

Test Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser

*** Variables ***
${newTestProjectName}  testProject9
${newTestProjectPrefix}  tp9
${newTestProjectDescription}  Description of new test project

*** Test Cases ***
Create new Test Project with no conflict

    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}




