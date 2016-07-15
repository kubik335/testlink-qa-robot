*** Settings ***

Documentation  Test Suite with several Test Cases, that are used to control creating test suite only with name
...            and detail information, renaming it and  deleting. Another test case controls moving function
...            of EMPTY and NOT EMPTY test suites via DRAG & DROP.

Resource       ../../../resource/testlink1.robot

Suite Setup  Run keywords       Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close Browser

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}               testSuite
${newTestProjectPrefix}             management
${newTestProjectDescription}        Description
${testSuiteName1}                   tsuite80
${suiteDescription}                 Description
${testDescription}                  testDescription
${testSuiteName2}                   tsuite81
${testSuiteName3}                   tsuite82
${testCaseName1}                    tc82
${testCaseName2}                    tc82_1

*** Test Cases ***

80 Create Test Suite Easy
    Controll Warning Message And Create Test Suite ${testSuiteName1} ${suiteDescription}
    Check If Test Suite Was Created ${testSuiteName1}

81 Rename Test Suite Easy
    Edit Test Suite ${testSuiteName1} Move It Copy It ${testSuiteName2}

82 Drag drop
    Preconditions for tc82
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Move suite ${testSuiteName1} to suite ${testSuiteName3}
    testSpecificationPage.Move suite ${testSuiteName2} to suite ${testSuiteName3}
    wait until keyword succeeds  1min  0  Check this testcase structure after movement

84 Delete Test Suite
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Delete New Test Suite ${testSuiteName1}

*** Keywords ***
Preconditions for tc82
    Create test suite ${testSuiteName3} in test project ${newTestProjectName}
    Create test suite ${testSuiteName1} in test project ${newTestProjectName}
    Create test case ${testCaseName1} in ${testSuiteName2}
    Create test case ${testCaseName2} in ${testSuiteName2}

Check this testcase structure after movement
    testSpecificationPage.Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains  ${testSuiteName1}
    wait until page contains  ${testSuiteName2}
    wait until page contains  ${testSuiteName3}
    wait until page contains  ${testCaseName1}
    wait until page contains  ${testCaseName2}
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName3}")]/ul/li[contains(.,"${testSuiteName1}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName3}")]/ul/li[contains(.,"${testSuiteName2}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName3}")]/ul/li[contains(.,"${testSuiteName2}")]/ul/li[contains(.,"${testCaseName1}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName3}")]/ul/li[contains(.,"${testSuiteName2}")]/ul/li[contains(.,"${testCaseName2}")]
    unselect frame