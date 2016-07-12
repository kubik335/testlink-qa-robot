*** Settings ***
Documentation  Test Suite with Test Cases that controls creating of new requirement specification, editing this
...            requirement and creating test case related to the reauirement operation.

Resource  ../../../../resource/testlink1.robot

Suite Setup         Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords     Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND              Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           manualManagement
${newTestProjectPrefix}         manual
${dokumentID}                   newdokument
${title}                        newtitle

*** Test Cases ***

38 Create requirement specification
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS)
    Choose Requirement Specification
    Create Requirement Operations

40 Modify requirement
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS)
    Choose Requirement Specification
    Create Requirement Operations
    Edit Requirement Operations

41 Create requirement specification
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS)
    Choose Requirement Specification
    Create Requirement Operations
    Create Test Case From Requirement
    Check Test Specification
