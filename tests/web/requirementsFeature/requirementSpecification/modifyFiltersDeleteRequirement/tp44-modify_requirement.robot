*** Settings ***
Documentation  The test case for modifying requirement, selecting existing requirements and
...            checkin any changes made with versions of the requirement.

Resource  ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject

Test Teardown  Run keywords     testlink.Delete Requirement Specification
...             AND             testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             testlink.Check that test has been deleted
...             AND             Close browser
*** Variables ***

${newTestProjectName}  testProject44
${newTestProjectPrefix}  tp44
${dokumentID}   newdokumentid44
${title}        newtitle44



*** Test Cases ***

Modify filters requirement

        #testlink.Change and check test project with RS control
        testlink.Go to Requirement Specification (mainframe)
        testlink.Create New Requirement Specification (type URS)
        testlink.Choose Requirement Specification
        testlink.Create Requirement Operations
        testlink.Create New Version Of Requirement
        testlink.Go to index page
        testlink.Go to Requirement Specification (mainframe)
        testlink.Choose Requirement Specification
        testlink.Delete Requirement Specification NO
        testlink.Select More Than 1 Version Requirement
        testlink.Delete More Than 1 Version Requirement
        testlink.Check Requirement Version