*** Settings ***

Documentation  The test suite with several test cases for checking basic functions for editing, creating and deleting Test Plan.
...            Several Test Cases controls creating Test plan with unique information,
...            creating using the "create as copy" feature, creating using the "create as copy" feature
...            with all checkboxes "unchecked".

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderTestSpecification.robot

Suite Setup  Run keywords    Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND          Go to index page and change testproject

Suite Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND            close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           createTestPlan
${newTestProjectPrefix}         createTest
${newTestProjectDescription}    DesctiptioneOfTestProject
${testSuiteName}                testSuite56
${testCaseName}                 tc56
${TestPlanName}                 testPlan53
${TestPlanName1}                testPlan54
${TestPlanName2}                testPlan55
${EditTestPlanName}             testPlan56
${TestPlanDescription}          DescriptionOfTestPlan
${PlatformName}                 Platform
${buildName}                    buildName
${buildDescription}             DescriptionOfBuild
${Username}                     renat.kulalov

*** Test Cases ***

53 Create new test plan
    Create New Test Plan ${TestPlanName}

54 Create test plan AS COPY
    Create Test Plan Management AS COPY ${TestPlanName1}

55 Create test plan AS COPY ALL OPTIONS UNCHECKED
    Create Test Plan AS COPY Unselect all checkboxes ${TestPlanName2}

56 Edit Test Plan
    Preconditions for tc56
    Order By Test Case, Name, Build In Test Plan Management
    Make all Test Plan Active/Inactive
    Edit And Check Test Plan

59 Assign Roles
    Assign Roles ${EditTestPlanName}
    Check That Roles Were Assigned ${EditTestPlanName}

60 Delete Test Plan
    Delete Test Plan Management  ${TestPlanName2}

*** Keywords ***
Preconditions for tc56
    Create Build with name ${buildName}
    Create test suite ${testSuiteName} in test project ${newTestProjectName}
    Create test case ${testCaseName} in ${testSuiteName}
    Add Test Case To the Test Plan ${testCaseName}



