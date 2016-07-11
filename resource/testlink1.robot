*** Settings ***
Library  Selenium2Library
Resource  ../resource/pageObjects/loginPage.robot
Resource  ../resource/pageObjects/desktop/desktopPage.robot
Resource  ../resource/pageObjects/desktop/headerPage.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/assignRequirements.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/requirementSpecificationEdit.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/assignRequirementsNavigator.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/generateRequirementSpecificationDocument.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/requirementOverview.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/requirementSpecification(mainframe).robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/searchRequirements.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/searchRequirementSpecifications.robot
Resource  ../resource/pageObjects/desktop/system/defineCustomFields.robot
Resource  ../resource/pageObjects/desktop/system/issueTrackerManagement.robot
Resource  ../resource/pageObjects/desktop/system/editIssueTracker.robot
Resource  ../resource/pageObjects/desktop/testProject/assignCustomFields.robot
Resource  ../resource/pageObjects/desktop/testProject/assignUserRoles.robot
Resource  ../resource/pageObjects/desktop/testProject/keywordManagement.robot
Resource  ../resource/pageObjects/desktop/testProject/platformManagement.robot
Resource  ../resource/pageObjects/desktop/testProject/testProjectManagement.robot
Resource  ../resource/pageObjects/desktop/testSpecification/assignKeywords.robot
Resource  ../resource/pageObjects/desktop/testSpecification/searchTestCases.robot
Resource  ../resource/pageObjects/desktop/testSpecification/testCasesCreatedPerUser.robot
Resource  ../resource/pageObjects/desktop/testSpecification/testSpecificationPage.robot
Resource  ../resource/pageObjects/desktop/testProject/createTestProjectPage.robot
Resource  ../resource/pageObjects/desktop/testProject/testProjectEdit.robot
Resource  ../resource/pageObjects/desktop/userManagement/userManagement.robot
Resource  ../resource/pageObjects/desktop/TestPlan/testPlanManagement.robot
Resource  ../resource/pageObjects/desktop/TestPlan/assignRolesForTP.robot
Resource  ../resource/pageObjects/desktop/TestPlan/testPlanManagement_detail.robot
Resource  ../resource/pageObjects/desktop/mySettings/mySettings.robot
Resource  ../resource/pageObjects/desktop/TestPlan/buildsReleases.robot
Resource  ../resource/pageObjects/desktop/testExecution/executeTestsPage.robot
Resource  ../resource/pageObjects/desktop/testExecution/reportsAndMetricsPage.robot
Resource  ../resource/pageObjects/desktop/events/eventsPage.robot
Resource  ../resource/pageObjects/desktop/testPlanContents/addRemoveTestCases.robot
Resource  ../resource/pageObjects/desktop/testPlanContents/assignTestCaseExecution.robot
Resource  ../resource/pageObjects/desktop/testPlanContents/updateLinkedTcVersion.robot
Resource  ../resource/pageObjects/desktop/testPlanContents/addRemovePlatforms.robot
Resource  ../resource/helper/desktopHeaderPage.robot
*** Variables ***


*** Keywords ***

Check header links
    headerPage.Go to index page and change testproject
    headerPage.I am here in full
    HeaderPage Go to ${mySettings}
    mySettings.I am here
    HeaderPage Go to ${desktop}
    desktopPage.I am here
    HeaderPage Go to ${requirementSpec}
    requirementSpecification(mainframe).I am here
    HeaderPage Go to ${testSpec}
    testSpecificationPage.I am here
    HeaderPage Go to ${testExecution}
    executeTestsPage.I am here
    HeaderPage Go to ${testReports}
    reportsAndMetricsPage.I am here
    HeaderPage Go to ${userManagement}
    userManagement.I am here
    HeaderPage Go to ${events}
    eventsPage.I am here
    HeaderPage Go to ${indexPage}


Delete test project
    [Arguments]  ${newTestProjectName}  ${newTestProjectPrefix}
    desktopHeaderPage.Go to and check ${testProjectManagement} ${testProjectManagement}
    testProjectManagement.Check Test Project Management
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    wait until page does not contain element  ${newTestProjectName}
    wait until page does not contain element  ${newTestProjectPrefix}
    unselect frame

Start creating new test project without conflict ${newTestProjectName} ${newTestProjectPrefix}
    desktopHeaderPage.Go to and check ${testProjectManagement} ${testProjectManagement}
    Check unique test project ${newTestProjectName} and ${newTestProjectPrefix}
    testProjectManagement.Click Create

Check unique test project ${newTestProjectName} and ${newTestProjectPrefix}
    testProjectManagement.Check Test Project Management
    select frame  mainframe
    element should not contain  item_view_wrapper  ${newTestProjectName}
    element should not contain  item_view_wrapper  ${newTestProjectPrefix}
    unselect frame

Fill information to create test without conflict ${newTestProjectName} ${newTestProjectPrefix}
    wait until keyword succeeds  1min  0  createTestProjectPage.I am here
    select frame  mainframe
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}
    createTestProjectPage.Select Unselected Checkboxes
    unselect frame

Create TP ${newTestProjectName} ${newTestProjectPrefix}
    Start creating new test project without conflict ${newTestProjectName} ${newTestProjectPrefix}
    Fill information to create test without conflict ${newTestProjectName} ${newTestProjectPrefix}
    Submit and check new test project

Submit and check new test project
    createTestProjectPage.Click Create
    No warning about existing projects
    testProjectManagement.Check new project exists  ${newTestProjectName}

No warning about existing projects
    createTestProjectPage.Warning message is not here

Login as admin ${LOGIN} ${PASSWORD}
    loginPage.Open Browser To Login Page
    wait until keyword succeeds  1min  0  loginPage.Wait until page contains all elements for login
    Fill credentials and submit ${LOGIN} ${PASSWORD}

Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
    Login as admin ${LOGIN} ${PASSWORD}
    loginPage.Check there is no warning about login
    Create TP ${newTestProjectName} ${newTestProjectPrefix}

Start creating Define Custom Fields
    [Tags]  tp105
    desktopHeaderPage.Change Test Project and go to ${customFields} ${checkCustomField}
    defineCustomFields.Creating Define Custom Fields

Edit information Custom Field and Check New Custom Field
    [Tags]  tp106
    desktopHeaderPage.Change Test Project and go to ${customFields} ${checkCustomField}
    defineCustomFields.Edit information CF and Check New CF

Delete Custom Field ${CFNAME}
    [Tags]  tp105
    desktopHeaderPage.Change Test Project and go to ${customFields} ${checkCustomField}
    defineCustomFields.Delete CF ${CFNAME}

Delete all created issue trackers
    [Tags]  tp107, tp108
    desktopHeaderPage.Change Test Project and go to ${issueTrackerName} ${checkIssueTracker}
    issueTrackerManagement.Delete Issue trackers

Create Issue Tracker
    [Tags]  tp108
    desktopHeaderPage.Change Test Project and go to ${issueTrackerName} ${checkIssueTracker}
    issueTrackerManagement.Create IT
    headerPage.Go to index page

Click created Issue Tracker with name ${ISSUETRACKER}
    [Tags]  tp108
    desktopHeaderPage.Change Test Project and go to ${issueTrackerName} ${checkIssueTracker}
    issueTrackerManagement.Check Issue Tracker Management
    issueTrackerManagement.Click created IT ${ISSUETRACKER}

Modify name and type of Issue Tracker
    [Tags]  tp108
    editIssueTracker.Modify name and type of Issue Tracker ${NEWISSUETRACKER}
    issueTrackerManagement.Check Issue Tracker named ${NEWISSUETRACKER}
    Click created Issue Tracker with name ${NEWISSUETRACKER}
    editIssueTracker.Modify name and type of Issue Tracker ${ISSUETRACKER}
    issueTrackerManagement.Check Issue Tracker named ${ISSUETRACKER}

Create all possible types of Issue Tracker and check it
    [Tags]  tp107
    desktopHeaderPage.Change Test Project and go to ${issueTrackerName} ${checkIssueTracker}
    issueTrackerManagement.Check Issue Tracker Management
    issueTrackerManagement.Fill all fields IT
    issueTrackerManagement.Check created issue trackers

Create New Test Plan ${TestPlanName}
    desktopHeaderPage.Change Test Project and go to ${testPlanManagement} ${testPlanManagement}
    wait until keyword succeeds  1min  0  desktopPage.Check Test Plan Management
    testPlanManagement.Create Test Plan Management
    testPlanManagement_detail.Input Name  ${TestPlanName}
    testPlanManagement_detail.Input Description
    testPlanManagement_detail.Select Checkbox Active
    testPlanManagement_detail.Select Checkbox Public
    testPlanManagement_detail.Click Create button to finish Test Plan Management
    wait until keyword succeeds  1min  0  testPlanManagement.Check Test Plan Management is Created ${TestPlanName}

Create and check role ${role} in user management
    HeaderPage Go to ${userManagement}
    userManagement.Click bookmark View roles
    userManagement.Create role ${role}

Start editing user
    [Tags]  tp101
    HeaderPage Go to ${userManagement}
    userManagement.Wait until page contains view users content
    userManagement.Click desired user

Validate settings fields
    [Tags]  tp96
    HeaderPage Go to ${mySettings}
    wait until keyword succeeds  1min  0  mySettings.I am here
    mySettings.Validate

Create test suite ${testSuiteName} in test project ${newTestProjectName}
    desktopHeaderPage.Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Create TS ${testSuiteName} ${newTestProjectName}

Create test case ${testCaseName} in ${testSuiteName}
    desktopHeaderPage.Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Create TC ${testSuiteName} in TS ${testCaseName}
    desktopHeaderPage.Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Select test case ${testCaseName} node
    testSpecificationPage.Create Step
    testSpecificationPage.Add Step after created first step

Create Build with name ${buildName}
    [Tags]  tp63
    wait until keyword succeeds  1min  0  headerPage.Go to index page and change testproject
    Start creating build
    Add Details and Finish creating build ${buildName}
    Check if Build was created ${buildName}

Start creating build
    [Tags]  tp63
    desktopHeaderPage.Change Test Project and go to ${buildReleases} ${checkBuildReleases}
    wait until keyword succeeds  1min  0  buildsReleases.Check Builds/Releases
    buildsReleases.Create Build

Add Test Suite to Test Plan
    [Tags]  91
    desktopHeaderPage.Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Add Test Cases to the Test Plan

Execute Test Suite
    [Tags]  91
    desktopHeaderPage.Change Test Project and go to ${executeTests} ${executeTests}
    executeTestsPage.Execute Test Cases

Create Test Suite
    [Tags]  tp86
    desktopHeaderPage.Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Create Test Suite Button
    testSpecificationPage.Fill In The Fields

Keywords
    [Tags]  89
    desktopHeaderPage.Change Test Project and go to ${keywordManagement} ${keywordManagement}
    assignKeywords.Create Keyword
    assignKeywords.Check Keyword Was Created
    assignKeywords.Click Assign Keyword to Test Case
    testSpecificationPage.Select test case ${testCaseName} node
    assignKeywords.Assign Keywords

Create New Version Of TC
    [Tags]  tp78
    desktopHeaderPage.Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    testSpecificationPage.Create New Version of TestCase

Add Platform to Test Plan
    desktopHeaderPage.Change Test Project and go to ${addRemovePlatforms} ${addRemovePlatforms}
    addRemovePlatforms.Add Platform

Add TC ${testCaseName} to platform ${PlatformName} users ${Username}
    [Tags]  tp74
    desktopHeaderPage.Change Test Project and go to ${addRemoveTestCases} ${checkAddRemoveTestCases}
    addRemoveTestCases.Assign to user ${Username} & platform ${PlatformName} TC

Update linked TC ${testCaseName} ${testSuiteName} version
    [Tags]  tp78
    desktopHeaderPage.Change Test Project and go to ${updateTCVersion} ${updateTCVersion}
    updateLinkedTcVersion.Update New Version of Test Case

Check TC Version was changed ${testCaseName} ${testSuiteName} in Update Linked TC Version
    [Tags]  tp78
    desktopHeaderPage.Change Test Project and go to ${updateTCVersion} ${updateTCVersion}
    updateLinkedTcVersion.UpdateLinkedTcVersion Check TC Was Changed

Check TC Version was changed ${testCaseName} ${testSuiteName} in Assign TC Execution
    [Tags]  tp78
    desktopHeaderPage.Change Test Project and go to ${assignTCExecution} ${assignTCExecution}
    assignTestCaseExecution.AssignTCExecution Check TC Was Changed

Check Assigned TC to ${Username} and ${PlatformName}
    [Tags]  tp74
    desktopHeaderPage.Change Test Project and go to ${assignTCExecution} ${assignTCExecution}
    assignTestCaseExecution.AssignTCExecution Check TC Was Corrected

Unassign TC ${PlatformName}
    [Tags]  tp74
    desktopHeaderPage.Change Test Project and go to ${addRemoveTestCases} ${checkAddRemoveTestCases}
    addRemoveTestCases.Unassign platform and its testCases ${PlatformName}

Check TC Are Not Assigned ${testSuiteName}
    [Tags]  tp74
    desktopHeaderPage.Change Test Project and go to ${assignTCExecution} ${assignTCExecution}
    wait until keyword succeeds  1min  0  assignTestCaseExecution.I am here
    wait until keyword succeeds  1min  0  assignTestCaseExecution.Check there is no assigned TC ${testSuiteName}