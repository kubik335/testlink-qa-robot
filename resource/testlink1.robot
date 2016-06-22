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

*** Variables ***


*** Keywords ***

Check header links
    headerPage.Change Test Project
    headerPage.I am here in full
    headerPage.Go to My Settings
    mySettings.I am here
    headerPage.Go to Desktop (Project)
    desktopPage.I am here
    headerPage.Go to Requirement Specification (titlebar)
    requirementSpecification(mainframe).I am here
    headerPage.Go to Test Specification (titlebar)
    testSpecificationPage.I am here
    headerPage.Go to Test Execution
    executeTestsPage.I am here
    headerPage.Go to Test Reports
    reportsAndMetricsPage.I am here
    headerPage.Go to User Management
    userManagement.I am here
    headerPage.Go to Events
    eventsPage.I am here
    headerPage.Go to index page

Check desktop links
    Go to index page
    desktopPage.Go to Define Custom Fields
    desktopPage.Check Define Custom Fields
    headerPage.Go to index page
    desktopPage.Go to Issue Tracker Management
    desktopPage.Check Issue Tracker Management
    headerPage.Go to index page
    desktopPage.Go to Test Project Management
    desktopPage.Check Test Project Management
    headerPage.Go to index page
    desktopPage.Go to Assign User Roles
    desktopPage.Check Assign User Roles
    headerPage.Go to index page
    desktopPage.Go to Assign Custom Fields
    desktopPage.Check Assign Custom Fields
    headerPage.Go to index page
    desktopPage.Go to Keyword Management
    desktopPage.Check Keyword Management
    headerPage.Go to index page
    desktopPage.Go to Platform Management
    desktopPage.Check Platform Management
    headerPage.Go to index page
    desktopPage.Go to Requirement Specification (mainframe)
    desktopPage.Check Requirement Specification (mainframe)
    headerPage.Go to index page
    desktopPage.Go to Requirement Overview
    desktopPage.Check Requirement Overview
    headerPage.Go to index page
    desktopPage.Go to Search Requirements
    desktopPage.Check Search Requirements
    headerPage.Go to index page
    desktopPage.Go to Search Requirement Specifications
    desktopPage.Check Search Requirement Specifications
    headerPage.Go to index page
    desktopPage.Go to Assign Requirements
    desktopPage.Check Assign Requirements
    headerPage.Go to index page
    desktopPage.go to Generate Requirement Specification Document
    desktopPage.Check Generate Requirement Specification Document
    headerPage.Go to index page
    desktopPage.Go to Test Specification (mainframe)
    desktopPage.Check Test Specification (mainframe)
    headerPage.Go to index page
    desktopPage.Go to Search Test Cases
    desktopPage.Check Search Test Cases
    headerPage.Go to index page
    desktopPage.Go to Assign Keywords
    desktopPage.Check Assign Keywords
    headerPage.Go to index page
    desktopPage.Go to Test Cases Created Per User
    desktopPage.Check Test Cases Created Per User
    headerPage.Go to index page
    desktopPage.Go to Test Plan Management
    desktopPage.Check Test Plan Management
    headerPage.Go to index page
    desktopPage.Go to Builds/Releases
    desktopPage.Check Builds/Releases
    headerPage.Go to index page
    desktopPage.Go to Milestone Overview
    desktopPage.Check Milestone Overview
    headerPage.Go to index page
    desktopPage.Go to Execute Tests
    desktopPage.Check Execute Tests
    headerPage.Go to index page
    desktopPage.Go to Test Cases Assigned to Me
    desktopPage.Check Test Cases Assigned to Me
    headerPage.Go to index page
    desktopPage.Go to Test Reports and Metrics
    desktopPage.Check Test Reports and Metrics
    headerPage.Go to index page
    desktopPage.Go to Metrics Dashboard
    desktopPage.Check Metrics Dashboard
    headerPage.Go to index page
    desktopPage.Go to Add/Remove Platforms
    desktopPage.Check Add/Remove Platforms
    headerPage.Go to index page
    desktopPage.Go to Add/Remove Test Cases
    desktopPage.Check Add/Remove Test Cases
    headerPage.Go to index page
    desktopPage.Go to Assign Test Case Execution
    desktopPage.Check Assign Test Case Execution
    headerPage.Go to index page
    desktopPage.Go to Set Urgent Tests
    desktopPage.Check Set Urgent Tests
    headerPage.Go to index page
    desktopPage.Go to Update Linked Test Case Versions
    desktopPage.Check Update Linked Test Case Versions
    headerPage.Go to index page
    desktopPage.Go to Show Test Cases Newest Versions
    desktopPage.Check Show Test Cases Newest Versions
    headerPage.Go to index page

Delete test project
    [Arguments]  ${newTestProjectName}  ${newTestProjectPrefix}
    headerPage.Go to index page
    desktopPage.Wait until page contains all elements
    desktopPage.Go to Test Project Management
    testProjectManagement.Check Test Project Management
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    wait until page does not contain element  ${newTestProjectName}
    wait until page does not contain element  ${newTestProjectPrefix}
    unselect frame

Start creating new test project without conflict ${newTestProjectName} ${newTestProjectPrefix}
    desktopPage.Go to Test Project Management
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
    headerPage.Go to index page
    desktopPage.Go to Define Custom Fields
    defineCustomFields.Creating Define Custom Fields

Edit information Custom Field and Check New Custom Field
    [Tags]  tp106
    headerPage.Go to index page
    desktopPage.Go to Define Custom Fields
    defineCustomFields.Edit information CF and Check New CF

Delete Custom Field ${CFNAME}
    [Tags]  tp105
    headerPage.Go to index page
    desktopPage.Go to Define Custom Fields
    defineCustomFields.Delete CF ${CFNAME}

Delete all created issue trackers
    [Tags]  tp107, tp108
    headerPage.Go to index page
    desktopPage.Go to Issue Tracker Management
    issueTrackerManagement.Delete Issue trackers

Create Issue Tracker
    [Tags]  tp108
    headerPage.Go to index page
    desktopPage.Go to link Issue Tracker Management
    issueTrackerManagement.Create IT
    headerPage.Go to index page

Click created Issue Tracker with name ${ISSUETRACKER}
    [Tags]  tp108
    headerPage.Go to index page
    desktopPage.Go to link Issue Tracker Management
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
    headerPage.Go to index page
    desktopPage.Go to Issue Tracker Management
    issueTrackerManagement.Check Issue Tracker Management
    issueTrackerManagement.Fill all fields IT
    issueTrackerManagement.Check created issue trackers

Create New Test Plan ${TestPlanName}
    headerPage.Go to index page and change testproject
    wait until keyword succeeds  1min  0  desktopPage.I am here
    desktopPage.Go to Test Plan Management
    wait until keyword succeeds  1min  0  desktopPage.Check Test Plan Management
    testPlanManagement.Create Test Plan Management
    testPlanManagement_detail.Input Name  ${TestPlanName}
    testPlanManagement_detail.Input Description
    testPlanManagement_detail.Select Checkbox Active
    testPlanManagement_detail.Select Checkbox Public
    testPlanManagement_detail.Click Create button to finish Test Plan Management
    wait until keyword succeeds  1min  0  testPlanManagement.Check Test Plan Management is Created  ${TestPlanName}

Create and check role ${role} in user management
    headerPage.Go to index page and change testproject
    wait until keyword succeeds  1min  0  headerPage.I am here
    headerPage.Go to User Management
    userManagement.Click bookmark View roles
    userManagement.Create role ${role}

Start editing user
    [Tags]  tp101
    headerPage.Go to index page
    headerPage.Go to User Management
    userManagement.Wait until page contains view users content
    userManagement.Click desired user

Set My Personal Data
    mySettings.Set Personal data back to normal
    mySettings.Change Password back

Validate settings fields
    [Tags]  tp96
    headerPage.Go to index page
    wait until keyword succeeds  1min  0  headerPage.I am here
    headerPage.Go to My Settings
    wait until keyword succeeds  1min  0  mySettings.I am here
    mySettings.Validate

Create test suite ${testSuiteName} in test project ${newTestProjectName}
    headerPage.Go to Index Page
    desktopPage.Go to Test Specification (mainframe)
    testSpecificationPage.Create TS ${testSuiteName} ${newTestProjectName}

Create test case ${testCaseName} in ${testSuiteName}
    headerPage.Go to Index Page
    desktopPage.Go to Test Specification (mainframe)
    testSpecificationPage.Create TC in TS

Create Build with name ${buildName}
    [Tags]  tp63
    wait until keyword succeeds  1min  0  headerPage.Go to index page and change testproject
    Start creating build
    Add Details and Finish creating build ${buildName}
    Check if Build was created ${buildName}

Start creating build
    [Tags]  tp63
    desktopPage.Go to Builds/Releases
    wait until keyword succeeds  1min  0  buildsReleases.Check Builds/Releases
    buildsReleases.Create Build