*** Settings ***

Documentation  This test case controls assigning test case execution to user.


Resource       ../../../../resource/testlink.robot
Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Create New Version Of TC
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Platform ${PlatformName}
...             AND         testlink.Create Platform ${PlatformName1}
...             AND         testlink.Add Platform to Test Plan
...             AND         testlink.Create Build with name ${buildName}
...             AND         testlink.Add TC ${testCaseName} to platform ${PlatformName} users ${Username}
...             AND         headerPage.go to index page


Test Teardown  Run keywords    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             close browser

*** Variables ***

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

    testlink.Update linked TC ${testCaseName} ${testSuiteName} version
    testlink.Check TC Version was changed ${testCaseName} ${testSuiteName} in Update Linked TC Version
    testlink.Check TC Version was changed ${testCaseName} ${testSuiteName} in Assign TC Execution