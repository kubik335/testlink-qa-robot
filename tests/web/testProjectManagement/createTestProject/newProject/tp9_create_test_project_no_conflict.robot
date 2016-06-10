*** Settings ***
Documentation  A test case for creating project without conflict (no existing project)
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




