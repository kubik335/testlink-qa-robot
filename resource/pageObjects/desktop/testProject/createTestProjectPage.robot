*** Settings ***

Documentation  This is the resource file containing all methods based on create project page
Library        Selenium2Library
Library        BuiltIn

*** Variables ***

*** Keywords ***

I am here
    select frame  mainframe
    wait until page contains element  copy_from_tproject_id
    wait until page contains element  tprojectName
    wait until page contains element  tcasePrefix
    wait until page contains element  xpath=//*[@id="item_view"]/tbody/tr[4]/td[2]/textarea
    wait until page contains element  optReq
    wait until page contains element  optPriority
    wait until page contains element  optAutomation
    wait until page contains element  optInventory
    wait until page contains element  active
    wait until page contains element  is_public
    wait until page contains element  go_back
    wait until page contains element  doActionButton
    unselect frame

#Click Template
    #click element  copy_from_tproject_id

#Choose from template
    #select from list by label  copy_from_tproject_id  ${newTestProjectName}

Choose no template
    select frame  mainframe
    select from list by label  copy_from_tproject_id  No
    unselect frame

Choose template from created project
    select frame  mainframe
    select from list by label  copy_from_tproject_id  ${newTestProjectName1}
    unselect frame

Fill Test Project Name
    [Arguments]  ${newTestProjectName}
    select frame  mainframe
    input text  tprojectName  ${newTestProjectName}
    unselect frame

Fill Test Project Prefix
    [Arguments]  ${newTestProjectPrefix}
    select frame  mainframe
    input text  tcasePrefix  ${newTestProjectPrefix}
    unselect frame

#Click Issue Tracker
    #click element  issue_tracker_id

#Choose from Issue Tracker
    #select from list by label  issue_tracker_id  ${issueTrackerName}

#Click Cancel
    #select frame  mainframe
    #click button  Cancel
    #unselect frame

Click Create
    select frame  mainframe
    wait until page contains  Create
    click button  Create
    unselect frame

No warning about existing projects
    page should not contain  There's already Test Project named ${newTestProjectName}
    page should not contain  Test Case ID prefix ${newTestProjectPrefix} already exists

Select Create From Existing Projects = No
    select frame  mainframe
    select from list  copy_from_tproject_id  0
    unselect frame

Unselect all features
    select frame  mainframe
    unselect checkbox  optReq
    unselect checkbox  optPriority
    unselect checkbox  optAutomation
    unselect checkbox  optInventory
    unselect frame

#Confirm warning about empty fields
    #select frame  mainframe
    #wait until page contains   cannot be empty!
    #click button  OK
    #unselect frame

Select Unselected Checkboxes
    select frame  mainframe
    select checkbox  optReq
    select checkbox  optInventory
    unselect frame

Fill all information about ${newTestProjectName} ${newTestProjectPrefix}
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}
    createTestProjectPage.Select Unselected Checkboxes

Fill information to create test without conflict ${newTestProjectName} ${newTestProjectPrefix}
    wait until keyword succeeds  1min  0  createTestProjectPage.I am here
    createTestProjectPage.Fill all information about ${newTestProjectName} ${newTestProjectPrefix}

Fill information to create test with template OFF
    createTestProjectPage.I am here
    createTestProjectPage.Choose no template
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}

Fill information to create test with template ON
    wait until keyword succeeds  1min  0  createTestProjectPage.I am here
    createTestProjectPage.Choose template from created project
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}

Fill information to create test (enchanced feautures)
    wait until keyword succeeds  1min  0  createTestProjectPage.I am here
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}
    createTestProjectPage.Select Create From Existing Projects = No
    createTestProjectPage.Unselect all features

