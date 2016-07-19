*** Settings ***
Documentation  Test Suite with several Test Cases that controls editing of existing project. One test cases is used for
...            checking validation of setting the project active or inactive, whereas another one is used for
...            changing the test project availibility.

Resource       ../../../../resource/helper/desktopHeaderTestProjectSettings.robot

Suite Setup  Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords     Delete Test Project  ${newTestProjectName1}  ${newTestProjectPrefix1}
...             AND              Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           modifyProject
${newTestProjectPrefix}         modifyProject
${newTestProjectName1}          modifyProject1
${newTestProjectPrefix1}        modifyProject1
${newTestProjectName2}          modifyProject2
${newTestProjectPrefix2}        modifyProject2
${newTestProjectName3}          modifyProject3
${newTestProjectPrefix3}        modifyProject3
${testprojectname}
${testprojectprefix}

*** Test Cases ***

12 Rename test project

    Change Test Project and go to ${testProjectManagement} ${testProjectManagement}
    Wait Until Page Contains TP and Click It
    Leave empty TP name and prefix
    Fill and Valid ${newTestProjectName1} ${newTestProjectPrefix1}

13 Set Test Project INACTIVE
    [Tags]  check
    Preconditions for tc13
    Click desired project ${newTestProjectName2}
    Unselect Checkbox Availibility Active
    Unactive Test Project by Bulb ${newTestProjectName2}
    Check Test Project Is Active ${newTestProjectName2}

15 Change Project Availibility
    Preconditions for tc15
    Go to and check ${testProjectManagement} ${testProjectManagement}
    Click desired project ${newTestProjectName3}
    Unselect Checkbox Availibility Active
    Check Test Project Is Inactive ${newTestProjectName3}

*** Keywords ***

Preconditions for tc13
    Login and Create new Test Project ${newTestProjectName2} ${newTestProjectPrefix2}

Preconditions for tc15
    Login and Create new Test Project ${newTestProjectName3} ${newTestProjectPrefix3}
