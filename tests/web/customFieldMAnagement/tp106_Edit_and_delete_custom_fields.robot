*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resource/testlink.robot
Test Setup      testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND              testlink.Delete EDITED Custom Field
...            AND              Close browser

*** Variables ***

${CFNAME}   DEFCUS
${NEWCFNAME}   DEFCUSEDITED
${CFLABEL}  FIELDEDITED
${newTestProjectName}           testProject106
${newTestProjectPrefix}         tp106
${newTestProjectDescription}    Description106

*** Test Cases ***

Create edit and delete new Custom Field

    testlink.Login as admin correct
    testlink.Start creating Define Custom Fields
    #testlink.Fill information to create Custom Field
    #testlink.Submit and check Define Custom Field
    testlink.Go to Define Custom Fields
    testlink.Edit information Custom Field
    testlink.Submit and check Edited Define Custom Field


