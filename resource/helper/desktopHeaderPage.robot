*** Settings ***
Library  Selenium2Library
Resource  ../../resource/pageObjects/desktop/desktopPage.robot
Resource  ../../resource/pageObjects/desktop/headerPage.robot

*** Variables ***

${customFields}                 Define Custom Fields
${checkCustomField}             Custom fields
${issueTrackerName}             Issue Tracker Management
${checkIssueTracker}            Issue Tracker
${testProjectManagement}        Test Project Management
${assignUserRoles}              Assign User Roles
${checkAssignUserRoles}         User Management
${assignCustomFields}           Assign Custom Fields
${checkAssignCustomFields}      Assign custom fields
${keywordManagement}            Keyword Management
${platformManagement}           Platform Management
${requirmSpecification}         Requirement Specification
${checkRequirmSpecification}    Requirement Specifications
${requirmOverview}              Requirement Overview
${searchRequirements}           Search Requirements
${checkSearchRequirements}      Test Project
${searchRequirementSpec}        Search Requirement Specifications
${checkSearchRequirementSpec}   Search Requirement Specifications
${assignRequirements}           Assign Requirements
${checkAssignRequirements}      Navigator - Test Specification
${generateReqSpecDoc}           Generate Requirement Specification Document
${checkGenerateReqSpecDoc}      Test Plan
${testSpecification}            Test Specification
${checkTestSpecification}       Test Specification
${searchTestCases}              Search Test Cases
${assignKeywords}               Assign Keywords
${checkAssignKeywords}          Navigator - Test Specification
${testCasesPerUser}             Test Cases created per User
${testPlanManagement}           Test Plan Management
${buildReleases}                Builds / Releases
${checkBuildReleases}           Build management
${milestoneOverview}            Milestone Overview
${checkMilestoneOverview}       Milestones for
${executeTests}                 Execute Tests
${testCasesAssigned}            Test Cases Assigned to Me
${checkTestCasesAssigned}       Test Cases Assigned to User
${testReportsMetrics}           Test Reports and Metrics
${checkTestReportsMetrics}      Reports and Metrics
${metricsDashboard}             Metrics Dashboard
${checkMetricsDashboard}        Test Project
${addRemovePlatforms}           Add / Remove Platforms
${addRemoveTestCases}           Add / Remove Test Cases
${checkAddRemoveTestCases}      Add/Remove Test Cases
${assignTCExecution}            Assign Test Case Execution
${setUrgentTests}               Set Urgent Tests
${updateTCVersion}              Update Linked Test Case Versions
${showTCVersion}                Show Test Cases Newest Versions
${checkShowTCVersion}           Newest versions


*** Keywords ***

Go to and check ${link} ${check}
    HeaderPage Go to ${indexPage}
    headerPage.I am here
    DesktopPage Go to ${link}
    desktopPage.Check link ${check}

Check desktop links
    desktopHeaderPage.Go to and check ${customFields} ${checkCustomField}
    desktopHeaderPage.Go to and check ${issueTrackerName} ${checkIssueTracker}
    desktopHeaderPage.Go to and check ${testProjectManagement} ${testProjectManagement}
    desktopHeaderPage.Go to and check ${assignUserRoles} ${checkAssignUserRoles}
    desktopHeaderPage.Go to and check ${assignCustomFields} ${checkAssignCustomFields}
    desktopHeaderPage.Go to and check ${keywordManagement} ${keywordManagement}
    desktopHeaderPage.Go to and check ${platformManagement} ${platformManagement}
    desktopHeaderPage.Go to and check ${requirmSpecification} ${checkRequirmSpecification}
    desktopHeaderPage.Go to and check ${requirmOverview} ${requirmOverview}
    desktopHeaderPage.Go to and check ${searchRequirements} ${checkSearchRequirements}
    desktopHeaderPage.Go to and check ${searchRequirementSpec} ${checkSearchRequirementSpec}
    desktopHeaderPage.Go to and check ${assignRequirements} ${checkAssignRequirements}
    desktopHeaderPage.Go to and check ${generateReqSpecDoc} ${checkGenerateReqSpecDoc}
    desktopHeaderPage.Go to and check ${testSpecification} ${checkTestSpecification}
    desktopHeaderPage.Go to and check ${searchTestCases} ${searchTestCases}
    desktopHeaderPage.Go to and check ${assignKeywords} ${checkAssignKeywords}
    desktopHeaderPage.Go to and check ${testCasesPerUser} ${testCasesPerUser}
    desktopHeaderPage.Go to and check ${testPlanManagement} ${testPlanManagement}
    desktopHeaderPage.Go to and check ${buildReleases} ${checkBuildReleases}
    desktopHeaderPage.Go to and check ${milestoneOverview} ${checkMilestoneOverview}
    desktopHeaderPage.Go to and check ${executeTests} ${executeTests}
    desktopHeaderPage.Go to and check ${testCasesAssigned} ${checkTestCasesAssigned}
    desktopHeaderPage.Go to and check ${testReportsMetrics} ${checkTestReportsMetrics}
    desktopHeaderPage.Go to and check ${metricsDashboard} ${checkMetricsDashboard}
    desktopHeaderPage.Go to and check ${addRemovePlatforms} ${addRemovePlatforms}
    desktopHeaderPage.Go to and check ${addRemoveTestCases} ${checkAddRemoveTestCases}
    desktopHeaderPage.Go to and check ${assignTCExecution} ${assignTCExecution}
    desktopHeaderPage.Go to and check ${setUrgentTests} ${setUrgentTests}
    desktopHeaderPage.Go to and check ${updateTCVersion} ${updateTCVersion}
    desktopHeaderPage.Go to and check ${showTCVersion} ${checkShowTCVersion}

Change Test Project and go to ${link} ${check}
    Go to index page and change testproject
    DesktopPage Go to ${link}
    desktopPage.Check link ${check}

Click on ${link} ${check}
    HeaderPage Go to ${indexPage}
    DesktopPage Go to ${link}
    desktopPage.Check link ${check}

Go to index page and change testproject
    HeaderPage Go to ${indexPage}
    Choose test project from dropdown

