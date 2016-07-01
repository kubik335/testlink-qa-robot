*** Settings ***

Documentation  Test suite with a single test case, that checks
...            execution of test.

Resource       ../../../resource/testlink1.robot

Test Setup  Run keywords            Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND                 Go to index page and change testproject
...             AND                 Create New Test Plan ${TestPlanName}
...             AND                 Create Build with name ${buildName}
...             AND                 Create Test Suite
...             AND                 Create test case ${testCaseName} in ${testSuiteName}
...             AND                 Create test case ${testCaseName2} in ${testSuiteName}
...             AND                 Create test case ${testCaseName3} in ${testSuiteName}

Test Teardown  Run keywords         Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND                 Close browser

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}               testExecution
${newTestProjectPrefix}             ts
${testSuiteName}                    tsuite91
${testDescription}                  DescriptionOfTest91
${testCaseName}                     tc91
${testCaseName2}                    tc91_1
${testCaseName3}                    tc91_2
${TestPlanName}                     testPlan
${TestPlanDescription}              Description
${buildName}                        buildName
${buildDescription}                 DescriptionOfBuild

*** Test Cases ***

91 Execute Test
    #Create Test Suite with several Test Cases for tp91
    Add Test Suite to Test Plan
    Execute Test Suite

*** Keywords ***

Create Test Suite with several Test Cases for tp91
    Go to index page and change testproject
    Create Test Suite
    Create test case ${testCaseName} in ${testSuiteName}
    Create test case ${testCaseName2} in ${testSuiteName}
    Create test case ${testCaseName3} in ${testSuiteName}
