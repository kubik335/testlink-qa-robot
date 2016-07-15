*** Settings ***

Documentation  This is the resource file containing all methods based on desktop page
Library        Selenium2Library


*** Variables ***

${customFields}                 Define Custom Fields
${checkCustomField}             Custom fields
${issueTracker}                 Issue Tracker Management
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
I am here
    select frame  mainframe
    wait until page contains  System
    wait until page contains  Define Custom Fields
    wait until page contains  Issue Tracker Management
    wait until page contains  Test Project
    wait until page contains  Test Project Management
    wait until page contains  Assign User Roles
    wait until page contains  Assign Custom Fields
    wait until page contains  Keyword Management
    wait until page contains  Platform Management
    wait until page contains  Test Specification
    wait until page contains  Test Cases created per User
    wait until page contains  Test Plan
    wait until page contains  Test Plan Management
    xpath should match x times  //div[@class="vertical_menu"]  2
    unselect frame

I am here in full
    wait until keyword succeeds  1min  0  desktopPage.I am here
    select frame  mainframe
    wait until page contains  Requirement Specification
    wait until page contains  Requirement Overview
    wait until page contains  Search Requirements
    wait until page contains  Search Requirement Specifications
    wait until page contains  Assign Requirements
    wait until page contains  Generate Requirement Specification Document
    unselect frame

Go to ${link}
    select frame  mainframe
    wait until page contains  ${link}
    click link  ${link}
    unselect frame

Check link ${check}
    select frame  mainframe
    ${count}  get matching xpath count  //frame[@name="treeframe"]
    run keyword if  ${count} > 0  Check treeframe ${check}
    run keyword if  ${count} == 0  Check mainframe ${check}
    unselect frame

Check mainframe ${check}
    unselect frame
    select frame  mainframe
    wait until page contains  ${check}
    unselect frame

Check treeframe ${check}
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains  ${check}
    unselect frame



