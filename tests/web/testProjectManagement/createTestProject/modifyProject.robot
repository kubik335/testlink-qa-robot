*** Settings ***
Documentation  Test Suite with several Test Cases that controls editing of existing project. One test cases is used for
...            checking validation of setting the project active or inactive, whereas another one is used for
...            changing the test project availibility.

Resource       ../../../../resource/testlink1.robot

Test Setup  Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Test Teardown  Delete Test Project  ${newTestProjectName}  ${newtestprojectprefix}

Suite Teardown  Run keywords   desktopHeaderPage.Click on ${issueTrackerName} ${checkIssueTracker}
...             AND            Delete Issue Tracker ${ISSUETRACKER}
...             AND            Close all browsers

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           modifyProject
${newtestprojectprefix}         modifyProject
${testprojectname}
${testprojectprefix}
${ISSUETRACKER}                 IssueTrackerName
${CONFIGURATION}  <!-- Template bugzillaxmlrpcInterface -->
            ...  <issuetracker>
            ...  <username>USERNAME</username>
            ...  <password>PASSWORD</password>
            ...  <uribase>http://bugzilla.mozilla.org/</uribase>
            ...  <!-- In order to create issues from TestLink, you need to provide this MANDATORY info -->
            ...  <product>BUGZILLA PRODUCT</product>
            ...  <component>BUGZILLA PRODUCT</component>
            ...  <!-- This can be adjusted according Bugzilla installation. -->
            ...  <!-- COMMENTED SECTION
            ...  There are defaults defined in bugzillaxmlrpcInterface.class.php.
            ...  <version>unspecified</version>
            ...  <severity>Trivial</severity>
            ...  <op_sys>All</op_sys>
            ...  <priority>Normal</priority>
            ...  <platform>All</platform> -->
            ...  </issuetracker>


*** Test Cases ***

12 Rename test project
    Change Test Project and go to ${testProjectManagement} ${testProjectManagement}
    Wait Until Page Contains TP and Click It
    Leave empty TP name and prefix
    Fill and Valid ${newTestProjectName} ${newtestprojectprefix}

13 Set Test Project INACTIVE
    Click desired project ${newTestProjectName}
    Unselect Checkbox Availibility Active
    Unactive Test Project by Bulb ${newTestProjectName}
    Check Test Project Is Active ${newTestProjectName}

14 Issue Tracker Management
    Preconditions for tc14
    Change Test Project and go to ${testProjectManagement} ${testProjectManagement}
    Add Issue Tracker to test project
    Save test project and check Issue Tracker has been added

15 Change Project Availibility
    Change Test Project and go to ${testProjectManagement} ${testProjectManagement}
    Click desired project ${newTestProjectName}
    Unselect Checkbox Availibility Active
    Check Test Project Is Inactive

*** Keywords ***
Preconditions for tc14
    headerPage.Go to index page and change testproject
    Create Issue Tracker


