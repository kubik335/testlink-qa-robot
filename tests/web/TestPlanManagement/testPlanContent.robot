*** Settings ***

Documentation  This test case controls assigning test case execution to user.


Resource    ../../../resource/testlink1.robot

Test Setup  Run keywords    Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         Create test case ${testCaseName} in ${testSuiteName}
...             AND         Create New Version Of TC
...             AND         Create New Test Plan ${TestPlanName}
...             AND         Create Platform ${PlatformName}
...             AND         Create Platform ${PlatformName1}
...             AND         Add Platform to Test Plan
...             AND         Create Build with name ${buildName}
...             AND         Add TC ${testCaseName} to platform ${PlatformName} users ${Username}

Test Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND            close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           testPlanContent
${newTestProjectPrefix}         testPlan
${newTestProjectDescription}    DesctiptioneOfTestProject
${testSuiteName}                tsuite74
${testCaseName}                 tc74
${TestPlanName}                 testPlan
${TestPlanDescription}          DescriptionOfTestPlan
${PlatformName}                 Platform74
${PlatformName1}                Platform74_1
${buildName}                    buildName
${Username}                     renat.kulalov
${Username1}                    jan.pippal
${buildDescription}             DescriptionOfBuild

*** Test Cases ***

78 Update Linked TC version
    Update linked TC ${testCaseName} ${testSuiteName} version
    testlink1.Check TC Version was changed ${testCaseName} ${testSuiteName} in Update Linked TC Version
    Check TC Version was changed ${testCaseName} ${testSuiteName} in Assign TC Execution