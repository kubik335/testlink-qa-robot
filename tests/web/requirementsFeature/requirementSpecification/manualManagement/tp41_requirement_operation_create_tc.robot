*** Settings ***
Documentation  The test case for creating test case related to requirement operation.

Resource  ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject

Test Teardown  Run keywords     testlink.Delete Test Suite
...             AND             testlink.Delete Requirement Specification
...             AND             testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             testlink.Check that test has been deleted
...             AND             Close browser

*** Variables ***

${newTestProjectName}  testProject41
${newTestProjectPrefix}  tp41
${dokumentID}   newdokumentid41
${title}        newtitle41



*** Test Cases ***

Create requirement specification

        testlink.Go to Requirement Specification (mainframe)
        testlink.Create New Requirement Specification (type URS)
        testlink.Choose Requirement Specification
        testlink.Create Requirement Operations
        testlink.Create Test Case From Requirement
        testlink.Go to index page
        testlink.Check Test Specification