*** Settings ***

Documentation  This test case controls Test case operations like: Export, Print,
...            Create a new version, Deactivate this version, Add to Test plan, Execution history.

Resource       ../../../../resource/testlink1.robot

Suite Setup  Run keywords    Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         Create New Test Plan ${TestPlanName}
...             AND         Create Build with name ${buildName}
...             AND         Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         Check New Test Suite

Suite Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser


*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}               createTestCase
${newTestProjectPrefix}             testCase
${TestPlanName}                     testPlan
${TestPlanDescription}              DescriptionOfTestPlan
${buildName}                        buildName
${buildDescription}                 DescriptionOfBuild
${testSuiteName}                    testsuite
${testDescription}                  testDescription
${testCaseName}                     tc86
${testCaseName2}                    tc89
${testCaseName3}                    tc89_1
${testCaseNameEdit}                 tc87


*** Test Cases ***

86 Create Test Case
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    Select test suite ${testSuiteName} node
    Click Test Case Button
    Fill informations test case ${testCaseName} and create
    Create Step in test case: ${testCaseName}
    Add Step after created first step

87 Edit test case
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    Select test case ${testCaseName} node and click action button
    Edit Test Case ${testCaseNameEdit}

89 Delete test case
    Preconditions for tc89
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    Select test case ${testCaseName} node and click action button
    Delete Test Case ${testCaseName}
    Select test case ${testCaseName2} node and click action button
    Delete Test Case ${testCaseName2}
    Select test case ${testCaseName3} node
    Delete Test Step

90 Test Case Operations
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    Create New Sibling ${testCaseName2}
    Check All Actions Buttons For Test Case
    Add Test Case To the Test Plan
    Execute Test
    Show Execution History

*** Keywords ***

Preconditions for tc89
    Add Test Case To the Test Plan ${testCaseName}
    Execute Test
    Keywords