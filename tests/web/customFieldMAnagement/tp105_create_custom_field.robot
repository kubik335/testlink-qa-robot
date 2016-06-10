*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resource/testlink.robot
Test Setup      testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND              testlink.Delete Custom Field
...            AND              Close browser

*** Variables ***
${CFNAME}   DEFCUS
${CFLABEL}  FIELD
${newTestProjectName}           testProject105
${newTestProjectPrefix}         tp105
${newTestProjectDescription}    Description105

*** Test Cases ***
Create new Custom Field
    [Tags]  control2
    testlink.Login as admin correct
    testlink.Start creating Define Custom Fields

