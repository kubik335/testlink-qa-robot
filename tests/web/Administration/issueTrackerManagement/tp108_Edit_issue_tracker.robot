*** Settings ***
Documentation  The test case controls editing mode for Issue Tarcker.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords        testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...            AND              headerPage.Go to index page
...            AND              testlink.Create Issue Tracker

Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND              Close all browsers

*** Variables ***
${newTestProjectName}           testProject108
${newTestProjectPrefix}         tp108
${newTestProjectDescription}    Description108
${ISSUETRACKER}  IssueTrackerName
${NEWISSUETRACKER}  newIssueTracker
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

Edit Issue Tracker Test Case
    [Tags]  control2

    testlink.Get to Issue Tracker Management
    testlink.Click created Issue Tracker with name ${ISSUETRACKER}
    testlink.Modify name and type of Issue Tracker
    testlink.Delete Issue Tracker ${ISSUETRACKER}
