*** Settings ***
Documentation  Test Suite with several Test Casas for creating a test project in different way.
...            TC9 creates test project with all required information and without creating
...            any conflict (uses a test project name not present on system,
...            use a PREFIX not present on system).
...            Several Test Cases are used for creating the first test project after a fresh
...            install with TEMPLATE OFF/TEMPLATE ON.
...            There is also a test case for creating test project and unchecking checkboxes,
...            such as "Enhanced features", "Issue Tracker Management", "Availability".

Resource       ../../../../resource/testlink1.robot


Test Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND           Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           newProject
${newTestProjectPrefix}         newProject
${newTestProjectDescription}    Description of new test project

*** Test Cases ***

7 Create new Test Project with template off
    Login as admin ${LOGIN} ${PASSWORD}
    Start creating new test project without conflict ${newTestProjectName} ${newTestProjectPrefix}
    Fill information to create test with template OFF
    Submit and check new test project

8 Create new Test Project with template ON
    Login as admin ${LOGIN} ${PASSWORD}
    Start creating new test project without conflict ${newTestProjectName} ${newTestProjectPrefix}
    Fill information to create test with template ON
    Submit and check new test project

9 Create new Test Project with no conflict
    Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

11 Create new Test Project with enhanced features
    Login as admin ${LOGIN} ${PASSWORD}
    Start creating new test project without conflict ${newTestProjectName} ${newTestProjectPrefix}
    Fill information to create test (enchanced feautures)
    Submit and check new test project