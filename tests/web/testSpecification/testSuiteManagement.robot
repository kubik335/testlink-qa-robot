*** Settings ***

Documentation  Test Suite with several Test Cases, that are used to control creating test suite only with name
...            and detail information, renaming it and  deleting. Another test case controls moving function
...            of EMPTY and NOT EMPTY test suites via DRAG & DROP.

Resource       ../../../resource/testlink1.robot

Suite Setup  Run keywords       Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords     Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close Browser

*** Variables ***

${newTestProjectName}               testSuite
${newTestProjectPrefix}             management
${newTestProjectDescription}        Description
${suite1}                           tsuite80
${suiteDescription}                 Description
${suite2}                           tsuite81
${suite3}                           tsuite82
${tc1}                              tc82
${tc2}                              tc82_1

*** Test Cases ***

80 Create Test Suite Easy
    Controll Warning Message And Create Test Suite ${suite1} ${suiteDescription}
    Check If Test Suite Was Created

81 Rename Test Suite Easy
    Edit Test Suite ${suite1} Move It Copy It ${suite2}

82 Drag drop
    Preconditions for tc82
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Move suite ${suite1} to suite ${suite3}
    testSpecificationPage.Move suite ${suite2} to suite ${suite3}
    wait until keyword succeeds  1min  0  Check this testcase structure after movement

84 Delete Test Suite
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Delete New Test Suite ${suite1}

*** Keywords ***

Preconditions for tc82
    Create test suite ${suite3} in test project ${newTestProjectName}
    Create test case ${tc1} in ${suite3}
    Create test case ${tc2} in ${suite3}

Check this testcase structure after movement
    testSpecificationPage.Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains  ${suite1}
    wait until page contains  ${suite2}
    wait until page contains  ${suite3}
    wait until page contains  ${tc1}
    wait until page contains  ${tc2}
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${suite3}")]/ul/li[contains(.,"${suite1}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${suite3}")]/ul/li[contains(.,"${suite2}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${suite3}")]/ul/li[contains(.,"${suite2}")]/ul/li[contains(.,"${tc1}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${suite3}")]/ul/li[contains(.,"${suite2}")]/ul/li[contains(.,"${tc2}")]
    unselect frame