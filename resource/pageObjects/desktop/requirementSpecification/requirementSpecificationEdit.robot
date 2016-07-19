*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

Create New Requirement Specification (type URS) ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  new_req_spec
    click element  new_req_spec
    wait until page contains element  title
    wait until page contains element  doc_id
    wait until page contains element  createSRS
    wait until page contains element  reqSpecType
    input text  doc_id  ${dokumentID}
    input text  title  ${title}
    select from list by value  reqSpecType  2
    click element  createSRS
    unselect frame

Choose Requirement Specification ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    sleep  2
    wait until page contains element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    click element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    unselect frame

Create Requirement Operations ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  create_req
    click button  create_req
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  name=create_req
    wait until page contains element  req_title
    wait until page contains element  reqDocId
    wait until page contains element  reqType
    wait until page contains element  reqStatus
    input text  reqDocId  ${dokumentID}
    input text  req_title  ${title}
    select from list by value  reqStatus  F
    select from list by value  reqType  1
    click element  create_req
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains  ${dokumentID}:${title}
    unselect frame

Edit Requirement Operations ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click element  expand_tree
    sleep  2
    wait until page contains element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    double click element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  edit_req
    click button  edit_req
    wait until page contains element  create_req
    wait until page contains element  reqStatus
    wait until page contains element  reqType
    select from list by value  reqStatus  I
    select from list by value  reqType  6
    input text  expected_coverage  1
    click element  create_req
    wait until page contains element  ext-gen30
    input text  ext-gen30  This is new log
    click button  OK
    unselect frame

Create Test Case From Requirement ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    sleep  2
    wait until page contains element  xpath=//a[span[contains(text(), "${dokumentID}:${title} ")]]
    double click element  xpath=//a[span[contains(text(), "${dokumentID}:${title} ")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  create_tcases
    click button  create_tcases
    wait until page contains element  create_tc_from_req
    wait until page contains element  xpath=//tbody//img[@title="check/uncheck all"]
    click element  xpath=//tbody//img[@title="check/uncheck all"]
    click button  create_tc_from_req
    unselect frame

Create New Version Of Requirement
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    wait until page contains element  collapse_tree
    click element  expand_tree
    sleep  2
    wait until page contains element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    double click element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  edit_req
    wait until page contains element  delete_req
    wait until page contains element  freeze_req_version
    wait until page contains element  copy_req
    wait until page contains element  new_revision
    wait until page contains element  new_version
    wait until page contains element  printerFriendly
    click button  new_version
    wait until page contains element  ext-gen30
    input text  ext-gen30  This is new log
    click button  OK
    unselect frame

Delete Requirement Specification NO
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  edit_req_spec
    wait until page contains element  deleteSRS
    click button  deleteSRS
    wait until page contains  No
    click button  No
    wait until page contains  Requirement Specification Operations
    unselect frame

Select More Than 1 Version Requirement
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    wait until page contains element  collapse_tree
    click element  expand_tree
    sleep  2
    wait until page contains element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    double click element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  edit_req
    wait until page contains element  delete_req
    wait until page contains element  freeze_req_version
    wait until page contains element  copy_req
    wait until page contains element  new_revision
    wait until page contains element  new_version
    wait until page contains element  printerFriendly
    unselect frame

Delete More Than 1 Version Requirement
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click button  delete_req_version
    wait until page contains element  ext-gen38
    wait until page contains  Yes
    click button  Yes
    wait until page contains  Req: ${dokumentID}-${title} Version 2 was successfully deleted
    unselect frame

Check Requirement Version
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    wait until page contains element  collapse_tree
    click element  expand_tree
    sleep  2
    wait until page contains element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    double click element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//td[starts-with(text(), 'Version') and contains(text(), '1 revision')]
    unselect frame
