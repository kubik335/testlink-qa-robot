*** Settings ***
Documentation  This test suite is used to check deleting and editing of Custom Fields in TestLink.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot

Suite Setup     Run keywords      Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND               Create New Test Plan ${TestPlanName}
...             AND               Create Build with name ${buildName}
...             AND               Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND               Create test suite ${testSuiteName1} in test project ${newTestProjectName}
...             AND               Create test case ${testCaseName} in ${testSuiteName}
...             AND               Keywords

Suite Teardown  Run keywords      Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND               Close browser

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}               layout
${newTestProjectPrefix}             layout
${newTestProjectName1}              layout1
${newTestProjectPrefix1}            layout1
${testSuiteName}                    tsuite109
${testSuiteName1}                   tsuite109_1
${testCaseName}                     tc109
${TestPlanName}                     testPlan
${TestPlanDescription}              Description
${buildName}                        buildName
${buildDescription}                 DescriptionOfBuild
${KeywordName}                      keyWord


*** Test Cases ***

5 Validation of changing the Test Project

    HeaderPage Go to ${indexPage}
    Create TP ${newTestProjectName1} ${newTestProjectPrefix1}
    Go to index page and change testproject
    Delete test project  ${newTestProjectName1}  ${newTestProjectPrefix1}

4 Log in as admin and check layout

    Check header links
    Check desktop links

109 Navigator Tree

    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    Expand tree
    Check Expand tree
    Collapse tree
    Check Collapse tree
    Control White Arrow
    Control Black Arrow

