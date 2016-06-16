*** Settings ***
Documentation  Test case for changing the Issue Tracker Managment.

Resource  ../../../../../resource/testlink.robot

Test Setup  Run Keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create Issue Tracker
...             AND         headerPage.Go to index page

Test Teardown  Run Keywords  testlink.Delete Issue Tracker from test Project
...                 AND      testlink.Delete Issue Tracker ${ISSUETRACKER}
...                 AND      testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...                 AND      Close all browsers


*** Variables ***
${ISSUETRACKER}  IssueTrackerName
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
${newTestProjectName}  testProject14
${newTestProjectPrefix}  tp14



*** Test Cases ***
Issue Tracker Management

    testlink.Go to Test Project Management
    testlink.Add Issue Tracker to test project
    testlink.Save test project and check Issue Tracker has been added


