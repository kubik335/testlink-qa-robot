*** Settings ***
Documentation  This test suite controls creating and editing of Issue Tarcker.

Resource       ../../../resource/testlink1.robot

Suite Setup     Run keywords        Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords        Delete all created issue trackers
...             AND                 Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND                 Close browser

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}           issueTrackerManagement
${newTestProjectPrefix}         ts
${newTestProjectDescription}    Test suite customFieldManagement: tp107, tp 108

${ISSUETRACKER}                 IssueTrackerName
${ISSUETRACKER1}                IssueTrackerName1
${ISSUETRACKER2}                IssueTrackerName2
${ISSUETRACKER3}                IssueTrackerName3
${ISSUETRACKER4}                IssueTrackerName4
${ISSUETRACKER5}                IssueTrackerName5
${ISSUETRACKER6}                IssueTrackerName6
${ISSUETRACKER7}                IssueTrackerName7
${ISSUETRACKER8}                IssueTrackerName8
${ISSUETRACKER9}                IssueTrackerName9
${ISSUETRACKER10}               IssueTrackerName10
${ISSUETRACKER11}               IssueTrackerName11
${NEWISSUETRACKER}              newIssueTracker
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

108 Edit Issue Tracker
    Create Issue Tracker
    Click created Issue Tracker with name ${ISSUETRACKER}
    Modify name and type of Issue Tracker

107 Issue Tracker Management
    Create all possible types of Issue Tracker and check it
