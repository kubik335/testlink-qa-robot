*** Settings ***
Documentation  Test Suite with several Test Cases that checks creating a relation between requirement and test case
...            and assigning/unassigning any available requirement for test cases.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot

Suite Setup  Run keywords       Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser
*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           requirementsRelations
${newTestProjectPrefix}         requi
${dokumentID}                   newdokumentid47
${title}                        newtitle47
${dokumentID1}                  newdokumentid48
${title1}                       newtitle48

*** Test Cases ***

47 Assign Requirements

    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS) ${dokumentID} ${title}
    Choose Requirement Specification ${dokumentID} ${title}
    Create Requirement Operations ${dokumentID} ${title}
    Create Test Case From Requirement ${dokumentID} ${title}
    Change Test Project and go to ${assignRequirements} ${checkAssignRequirements}
    Select Test Suite ${title}
    Assign Requirements ${dokumentID} ${title}
    Check Assigned Requirements ${title}

48 Relations between requirements and test cases

    Change Test Project and go to ${assignRequirements} ${checkAssignRequirements}
    Select Test Suite ${title}
    Check Assigned Requirements ${title}
    Unassign Requirements ${title}
    Check Availiable Requirements

