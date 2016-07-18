*** Settings ***
Documentation  Test Suite with one Test Case for modifying requirement, selecting existing requirements and
...            checkin any changes made with versions of the requirement.

Resource       ../../../../resource/helper/desktopHeaderTestProjectSettings.robot

Suite Setup    Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords     Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND              Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           modifyFiltersDelete
${newTestProjectPrefix}         modifyRequi
${dokumentID}                   newdokumentid
${title}                        newtitle

*** Test Cases ***

44 Modify filters requirement
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS)
    Choose Requirement Specification
    Create Requirement Operations
    Create New Version Of Requirement
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Choose Requirement Specification
    Delete Requirement Specification NO
    Select More Than 1 Version Requirement
    Delete More Than 1 Version Requirement
    Check Requirement Version