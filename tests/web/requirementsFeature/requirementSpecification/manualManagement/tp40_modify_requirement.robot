*** Settings ***
Documentation  The test case for modifying requirement.

Resource  ../../../../../resource/testlink.robot

Test Setup  testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Test Teardown  Run keywords  testlink.Delete Requirement Specification
...             AND             testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser
*** Variables ***

${dokumentID}   newdokumentid40
${title}        newtitle40
${newTestProjectName}  testProject40
${newTestProjectPrefix}  tp40


*** Test Cases ***

Modify requirement

        testlink.Change and check test project with RS control
        testlink.Go to Requirement Specification (mainframe)
        testlink.Create New Requirement Specification (type URS)
        testlink.Choose Requirement Specification
        testlink.Create Requirement Operations
        testlink.Edit Requirement Operations