*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

Select Test Suite ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  filter_testcase_name
    wait until page contains element  doUpdateTree
    input text  filter_testcase_name  ${title}
    click button  doUpdateTree
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click element  expand_tree
    wait until page contains element  xpath=//a[span[contains(text(),"${title} (")]]
    double click element  xpath=//a[span[contains(text(),"${title} (")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Requirements Specification Document
    unselect frame

Assign Requirements ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  idSRS
    click element  idSRS
    select from list by label  idSRS  [${dokumentID}] - ${title}
    wait until page contains element  actionButton
    click element  actionButton
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Please select a requirement
    wait until page contains element  xpath=//button[text()="OK"]
    click element  xpath=//button[text()="OK"]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//tbody//img[@title="check/uncheck all"]
    wait until page contains element  actionButton
    click element  xpath=//tbody//img[@title="check/uncheck all"]
    click element  actionButton
    unselect frame

Check Assigned Requirements ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click button  expand_tree
    wait until page contains element  xpath=//a[span[contains(text(),"${title} [1]")]]
    double click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="div_assigned_req"]/table/tbody
    unselect frame

Unassign Requirements ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click button  expand_tree
    wait until page contains element  xpath=//a[span[contains(text(),"${title} [1]")]]
    double click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="div_assigned_req"]/table/tbody
    wait until page contains element  unassign
    wait until page contains element  xpath=//*[@id="div_assigned_req"]//tbody//img[@title="check/uncheck all"]
    click element  xpath=//*[@id="div_assigned_req"]//tbody//img[@title="check/uncheck all"]
    click element  unassign
    unselect frame

Check Availiable Requirements
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Available Requirements
    wait until page does not contain element  xpath=//*[@id="div_assigned_req"]/table
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  div_free_req
    page should contain element  div_free_req
    unselect frame