*** Settings ***
Documentation  Test Suite with Test Cases that controls creating of new requirement specification, editing this
...            requirement and creating test case related to the reauirement operation.

Resource       ../../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../../resource/helper/desktopHeaderTestSpecification.robot

Suite Setup  Run keywords   Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords     Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND              Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           manualManagement
${newTestProjectPrefix}         manual
${dokumentID}                   newdokument38
${title}                        newtitle38
${dokumentID1}                  newdokument40
${title1}                       newtitle40
${dokumentID2}                  newdokument41
${title2}                       newtitle41

*** Test Cases ***

38 Create requirement specification

    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS) ${dokumentID} ${title}
    Choose Requirement Specification ${dokumentID} ${title}

40 Modify requirement

    Preconditions for tc40
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Choose Requirement Specification ${dokumentID1} ${title1}
    Create Requirement Operations ${dokumentID1} ${title1}
    Edit Requirement Operations ${dokumentID1} ${title1}

41 Create requirement specification

    Preconditions for tc41
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create Test Case From Requirement ${dokumentID2} ${title2}
    Check Test Specification ${title2}

*** Keywords ***

Preconditions for tc40
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS) ${dokumentID1} ${title1}
    Choose Requirement Specification ${dokumentID1} ${title1}

Preconditions for tc41
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS) ${dokumentID2} ${title2}
    Choose Requirement Specification ${dokumentID2} ${title2}
    Create Requirement Operations ${dokumentID2} ${title2}
    Choose Requirement Specification ${dokumentID2} ${title2}
    Create Requirement Operations ${dokumentID2} ${title2}