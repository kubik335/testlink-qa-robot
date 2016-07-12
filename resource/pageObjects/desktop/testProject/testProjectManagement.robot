*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}      chrome


*** Keywords ***

Check Test Project Management
    select frame  name=mainframe
    wait until page contains  Test Project Management
    wait until page contains element  search
    unselect frame

Click Create
    select frame  mainframe
    click button  Create
    unselect frame

Add Test Project Name
    select frame  name=mainframe
    input text  tprojectName  ${testprojectname}
    unselect frame

Add Prefix
    select frame  mainframe
    input text  tcasePrefix  ${testprojectprefix}
    unselect frame

Create Test Project
    select frame  mainframe
    click button  doActionButton
    unselect frame

Filled the valid name and prefix
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/tbody/tr[1]/td[2]/input
    wait until page contains element  xpath=//*[@id="item_view"]/tbody/tr[2]/td[2]/input
    input text  xpath=//*[@id="item_view"]/tbody/tr[1]/td[2]/input  ${newTestProjectName1}
    input text  xpath=//*[@id="item_view"]/tbody/tr[2]/td[2]/input   ${newtestprojectprefix1}
    #page should contain element   xpath=//*[@id="item_view"]/tbody/tr[1]/td[2]/input  ${newTestProjectName1}
    #page should contain element  xpath=//*[@id="item_view"]/tbody/tr[2]/td[2]/input   ${newtestprojectprefix1}
    Click Button  doActionButton
    unselect frame

Check Warning message
    select frame  mainframe
    execute javascript  var imput = document.getElementsByName('tprojectName'); imput[0].required = false;
    execute javascript  var imput = document.getElementsByName('tcasePrefix'); imput[0].required = false;
    click button  Save
    wait until page contains  Project name cannot be empty!
    wait until page contains  Warning!!
    wait until page contains  OK
    click button    OK
    unselect frame


Check new project exists
    [Arguments]  ${newTestProjectName}
    select frame  mainframe
    element should contain  xpath=//table[@id="item_view"]  ${newTestProjectName}
    unselect frame

Click desired project
    select frame  mainframe
    click link  ${newTestProjectName}
    unselect frame

Check Test Project Is Inactive
    select frame  mainframe
    page should contain element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Inactive (click to set active)"]]
    unselect frame

Check Test Project Is Active

    select frame  mainframe
    page should contain element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Active (click to set inactive)"]]
    unselect frame


Wait until container with projects is here
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/tfoot
    unselect frame

Unactive Test Project by Bulb

    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Inactive (click to set active)"]]
    page should not contain  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[input[@title="Active (click to set inactive)"]]
    unselect frame

Add issue tracker to test project
    select frame  name=mainframe
    wait until page contains element  xpath=//*[@id="issue_tracker_id"]
    wait until page contains element  issue_tracker_enabled
    select from list by label  xpath=//*[@id="issue_tracker_id"]  ${ISSUETRACKER} ( bugzilla (Interface: xmlrpc) )
    select checkbox  issue_tracker_enabled
    unselect frame

Remove issue tracker from test project
    select frame  name=mainframe
    wait until page contains element  xpath=//*[@id="issue_tracker_id"]
    wait until page contains element  issue_tracker_enabled
    unselect checkbox  issue_tracker_enabled
    select from list by value  xpath=//*[@id="issue_tracker_id"]  0
    unselect frame

Check Issue Tracker has been added to the Test Project
    select frame  mainframe
    wait until page contains element  xpath=//table[@id="item_view"]
    element should contain  xpath=//table[@id="item_view"]  ${ISSUETRACKER}
    unselect frame

Wait Until Page Contains TP and Click It
    select frame  mainframe
    wait until page contains element  xpath=//a[contains(.,"${newTestProjectName}")]
    click element  xpath=//a[contains(.,"${newTestProjectName}")]
    unselect frame

Delete TP ${newTestProjectName} ${newTestProjectPrefix}
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    wait until page does not contain element  ${newTestProjectName}
    wait until page does not contain element  ${newTestProjectPrefix}
    unselect frame

Check and Delete Test Project ${newTestProjectName} ${newTestProjectPrefix}
    testProjectManagement.Check Test Project Management
    testProjectManagement.Delete TP ${newTestProjectName} ${newTestProjectPrefix}

Check Test Project and Clikc Create ${newTestProjectName} ${newTestProjectPrefix}
    testProjectManagement.Check Test Project Management
    testProjectManagement.Check Unique ${newTestProjectName} ${newTestProjectPrefix}
    testProjectManagement.Click Create

Check Unique ${newTestProjectName} ${newTestProjectPrefix}
    select frame  mainframe
    element should not contain  item_view_wrapper  ${newTestProjectName}
    element should not contain  item_view_wrapper  ${newTestProjectPrefix}
    unselect frame

