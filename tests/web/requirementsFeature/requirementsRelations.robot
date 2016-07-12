*** Settings ***
Documentation  Test Suite with several Test Cases that checks creating a relation between requirement and test case
...            and assigning/unassigning any available requirement for test cases.

Resource    ../../../resource/testlink1.robot

Suite Setup  Run keywords       Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser
*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           requirementsRelations
${newTestProjectPrefix}         requi
${dokumentID}                   newdokumentid48
${title}                        newtitle48
${dokumentID1}                  newdokumentid48_1
${title1}                       newtitle48_1

*** Test Cases ***

47 Assign Requirements
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS)
    Choose Requirement Specification
    Create Requirement Operations
    Create Test Case From Requirement
    Change Test Project and go to ${assignRequirements} ${checkAssignRequirements}
    Select Test Suite
    Assign Requirements
    Check Assign Requirements

48 Relations between requirements and test cases
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS)
    Choose Requirement Specification
    Create Requirement Operations
    Create Another Requirement Operations
    Create Test Case From Requirement
    Change Test Project and go to ${assignRequirements} ${checkAssignRequirements}
    Select Test Suite
    Assign Requirements
    Unassign Requirements And Check Availiable Requirements