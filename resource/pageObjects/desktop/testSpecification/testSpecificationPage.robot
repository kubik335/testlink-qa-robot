*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

I am here
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//h1[text()="Navigator - Test Specification"]
    wait until page contains element  xpath=//span[contains(text(),"Settings")]
    wait until page contains element  xpath=//span[contains(text(),"Filters")]
    wait until page contains element  xpath=//input[@value="Apply"]
    wait until page contains element  xpath=//input[@value="Reset Filters"]
    wait until page contains element  xpath=//input[@value="Expand tree"]
    wait until page contains element  xpath=//input[@value="Collapse tree"]
    wait until page contains element  tree_div
    unselect frame

Add Filters Test Case Title Test Specification
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
    wait until page contains element  xpath=//a[span[contains(text(),"${title} [1]")]]
    click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  The Test Case was generated from the assigned requirement "${title}"
    unselect frame

Delete Test Suite
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
    wait until page contains  ${title}
    wait until page contains element  xpath=//a[span[contains(text(),"${title} (")]]
    click element  xpath=//a[span[contains(text(),"${title} (")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  delete_testsuite
    click element  delete_testsuite
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    #wait until page contains element  xpath=//img[@title="check/uncheck all"]
    #click element  xpath=//img[@title="check/uncheck all"]
    wait until page contains element  name=delete_testsuite
    click button  delete_testsuite
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  The Test Suite was successfully deleted
    unselect frame

Delete New Test Suite ${testSuiteName}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  doUpdateTree
    click button  doUpdateTree
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    click element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  delete_testsuite
    click element  delete_testsuite
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    #wait until page contains element  xpath=//img[@title="check/uncheck all"]
    #click element  xpath=//img[@title="check/uncheck all"]
    wait until page contains element  delete_testsuite
    click button  delete_testsuite
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  The Test Suite was successfully deleted
    unselect frame

Create Test Suite Button
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  new_testsuite
    click element  new_testsuite
    unselect frame

Fill In The Fields ${testSuiteName} ${testDescription}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  container_name
    wait until page contains element  add_testsuite_button
    wait until page contains element  cke_8
    input text  container_name  ${testSuiteName}
    click element  cke_8
    input text  xpath=//*[@id="cke_contents_details"]/textarea  ${testDescription}
    click element  add_testsuite_button
    unselect frame

Controll Warning Message
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  add_testsuite_button
    execute javascript  document.getElementById('name').required = false;
    click button  Save
    wait until page contains  Please give a name to Test Suite
    wait until page contains element  xpath=//button[text()="OK"]
    click element  xpath=//button[text()="OK"]
    unselect frame

Check If Test Suite Was Created ${testSuiteName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Test Suite created
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  doUpdateTree
    click button  doUpdateTree
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    unselect frame

Create Another Test Suite For Move Or Copy
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span[contains(text(),"${newTestProjectName} (")]]
    double click element  xpath=//a[span[contains(text(),"${newTestProjectName} (")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  new_testsuite
    click element  new_testsuite
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  container_name
    wait until page contains element  add_testsuite_button
    wait until page contains element  cke_8
    input text  container_name  ${testSuiteCopy}
    click element  cke_8
    input text  xpath=//*[@id="cke_contents_details"]/textarea  ${testDescriptionCopy}
    click element  add_testsuite_button
    unselect frame

#check test project and tsuite
    #select frame  mainframe
    #wait until page contains element  treeframe
    #select frame  treeframe
    #wait until page contains element  xpath=//a[span[contains(text(),"${newTestProjectName} (")]]
    #wait until page contains element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    #unselect frame

Edit Test Suite
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  name=edit_testsuite
    click element  edit_testsuite
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  container_name
    wait until page contains element  update_testsuite
    wait until page contains element  cke_8
    input text  container_name  ${suite2}
    wait until page contains element  xpath=//iframe[@title="Rich text editor, details"]
    mouse down  xpath=//iframe[@title="Rich text editor, details"]
    mouse up  xpath=//iframe[@title="Rich text editor, details"]
    select frame  xpath=//iframe[@title="Rich text editor, details"]
    input text  xpath=//body  ${testDescription}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click element  update_testsuite
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  updated!
    page should contain element  xpath=//p[contains(text(),"Test Suite ${suite2}")][contains(text(),"was successfully")][contains(text(),"updated!")]
    unselect frame

Copy Test Suite
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  move_testsuite_viewer
    click element  move_testsuite_viewer
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="containerID_chosen"]
    wait until page contains element  do_copy
    wait until page contains element  xpath=//div/b
    click element  xpath=//div/b
    wait until page contains  ${newTestProjectName}
    wait until page contains element  xpath=//ul[@class="chosen-results"]/li[text()="${newTestProjectName}"]
    #execute javascript  document.getElementById("containerID").style.display = "initial";
    #select from list by label  containerID  copyFile
    #input text  xpath=//*[@id="containerID_chosen"]/div/div/input  ${testSuiteCopy}
    #click element  xpath=//*[@id="containerID_chosen"]
    click element  do_copy
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//p[contains(text(),"Test Suite ${suite2}")][contains(text(),"has been copied inside")][contains(text(),"${newTestProjectName}")]
    unselect frame

Move Test Suite
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  move_testsuite_viewer
    click element  move_testsuite_viewer
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="containerID_chosen"]
    wait until page contains element  do_copy
    wait until page contains element  xpath=//div/b
    click element  xpath=//div/b
    wait until page contains  ${newTestProjectName}
    wait until page contains element  xpath=//ul[@class="chosen-results"]/li[2]
    click element  xpath=//ul[@class="chosen-results"]/li[2]
    click element  do_move
    unselect frame

Check Move And Copy Action
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click button  expand_tree
    wait until element contains  tree_div  ${suite2}
    wait until element contains  tree_div  20  #20160414:14:20:55 prefix
    xpath should match x times  //div/ul/li/ul/li/div/a/span[contains(.,"${suite2}")]  1
    xpath should match x times  //div/ul/li/ul/li/ul/li/div/a/span[contains(.,"${suite2}")]  1
    unselect frame

#Delete Another New Test Suite
    #select frame  mainframe
    #wait until page contains element  treeframe
    #select frame  treeframe
    #wait until page contains element  doUpdateTree
    #click button  doUpdateTree
    #unselect frame
    #select frame  mainframe
    #wait until page contains element  treeframe
    #select frame  treeframe
    #wait until page contains element  xpath=//a[span/span[contains(text(),"${testSuiteCopy}")]]
    #click element  xpath=//a[span/span[contains(text(),"${testSuiteCopy}")]]
    #unselect frame
    #select frame  mainframe
    #wait until page contains element  workframe
    #select frame  workframe
    #wait until page contains element  xpath=//img[@title="Actions"]
    #click element  xpath=//img[@title="Actions"]
    #wait until page contains element  delete_testsuite
    #click element  delete_testsuite
    #unselect frame
    #select frame  mainframe
    #wait until page contains element  workframe
    #select frame  workframe
    ##wait until page contains element  xpath=//img[@title="check/uncheck all"]
    ##click element  xpath=//img[@title="check/uncheck all"]
    #wait until page contains element  delete_testsuite
    #click button  delete_testsuite
    #unselect frame
    #select frame  mainframe
    #wait until page contains element  workframe
    #select frame  workframe
    #wait until page contains  The Test Suite was successfully deleted
    #unselect frame

#Drag and drop test suite
    #select frame  treeframe
    #drag and drop
    #unselect frame

Click Test Case Button
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  create_tc
    click element  create_tc
    unselect frame

Select test project ${newTestProjectName} node
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    click element  expand_tree
    wait until page contains element  xpath=//a[contains(.,"${newTestProjectName} (")]
    double click element  xpath=//a[contains(.,"${newTestProjectName} (")]
    unselect frame

Click Actions button
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    double click element  xpath=//img[@title="Actions"]
    unselect frame

Click new test suite
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  new_testsuite
    click element  new_testsuite
    unselect frame

Fill name for ts: ${testSuiteName} and submit
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  name
    wait until page contains element  add_testsuite_button
    input text  name  ${testSuiteName}
    click element  add_testsuite_button
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Test Suite created
    unselect frame

Select test suite ${testSuiteName} node
    testSpecificationPage.Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until element contains  tree_div  ${testSuiteName}
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName}")]/div/a
    click element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName}")]/div/a
    unselect frame

Click new test case
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  create_tc
    click element  create_tc
    unselect frame

Fill name for tc: ${testCaseName} and submit
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  testcase_name
    wait until page contains element  do_create_button
    input text  testcase_name  ${testCaseName}
    click element  do_create_button
    unselect frame

Create Step
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  create_step
    click button  create_step
    wait until page contains  Step actions
    wait until page contains element  xpath=//*[@id="cke_contents_steps"]/iframe
    mouse down  xpath=//*[@id="cke_contents_steps"]/iframe
    mouse up  xpath=//*[@id="cke_contents_steps"]/iframe
    select frame  xpath=//*[@id="cke_contents_steps"]/iframe
    input text  xpath=//body  StepAction
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Expected Results
    wait until page contains element  xpath=//*[@id="cke_contents_expected_results"]/iframe
    mouse down  xpath=//*[@id="cke_contents_expected_results"]/iframe
    mouse up  xpath=//*[@id="cke_contents_expected_results"]/iframe
    select frame  xpath=//*[@id="cke_contents_expected_results"]/iframe
    input text  xpath=//body  Expect.Results
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click button  do_update_step
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Step number:
    unselect frame

Add Step after created first step
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Step actions
    wait until page contains element  xpath=//*[@id="cke_contents_steps"]/iframe
    mouse down  xpath=//*[@id="cke_contents_steps"]/iframe
    mouse up  xpath=//*[@id="cke_contents_steps"]/iframe
    select frame  xpath=//*[@id="cke_contents_steps"]/iframe
    input text  xpath=//body  StepAction
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Expected Results
    wait until page contains element  xpath=//*[@id="cke_contents_expected_results"]/iframe
    mouse down  xpath=//*[@id="cke_contents_expected_results"]/iframe
    mouse up  xpath=//*[@id="cke_contents_expected_results"]/iframe
    select frame  xpath=//*[@id="cke_contents_expected_results"]/iframe
    input text  xpath=//body  Expect.Results
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click button  do_update_step
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Step number:
    wait until page contains element  do_update_step_and_exit
    wait until keyword succeeds  1min  0  testSpecificationPage.Click IT
    unselect frame

#Click on save & exit
    #select frame  mainframe
    #wait until page contains element  workframe
    #select frame  workframe
    ##wait until page contains element  xpath=(//div/input[@id="do_update_step_and_exit"])[2]
    #wait until page contains  Save & exit
    #wait until keyword succeeds  1min  0  testSpecificationPage.Click IT
    #unselect frame

Click IT
    click button  name=do_update_step_and_exit

Move suite ${from} to suite ${target}
    [Tags]  tp82
    testSpecificationPage.Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains  ${newTestProjectName}
    wait until page contains  ${from}
    wait until page contains  ${target}
    wait until page contains  ${newTestProjectPrefix}-1:${tc1}
    wait until page contains  ${newTestProjectPrefix}-2:${tc2}
    #mouse down  xpath=//ul/li/ul/li[contains(.,"${from}")]/div/img[2]
    #mouse over  xpath=//ul/li/ul/li[contains(.,"${target}")]/div/img[2]
    #mouse up  xpath=//ul/li/ul/li[contains(.,"${target}")]/div/img[2]
    drag and drop  xpath=//ul/li/ul/li[contains(.,"${from}")]/div/img[2]  xpath=//ul/li/ul/li[contains(.,"${target}")]/div/img[2]
    unselect frame

Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click element  expand_tree
    unselect frame

Collapse tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  collapse_tree
    click element  collapse_tree
    unselect frame

Click on arrow to unfold
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until element is visible  xpath=//*[@id="extdd-1"]/img[1]
   #wait until page contains element  xpath=(//span[contains(text(),"tsuite109_1 (0)")])[1]
    click element  xpath=//*[@id="extdd-1"]/img[1]
    unselect frame

Check Collapse tree
    select frame  mainframe
    select frame  treeframe
    wait until page contains   ${newTestProjectName}
    wait until page contains element  xpath=//*[@id="extdd-1"]/img[1]
    page should contain element  xpath=//*[@id="extdd-1"]/img[1]
    page should not contain  ${testSuiteName}
    page should not contain  ${testSuiteName1}
    unselect frame

Check Expand tree
    select frame  mainframe
    page should contain element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=(//span[contains(text(),"${testSuiteName}")])[1]
    wait until page contains element  xpath=(//span[contains(text(),"${testSuiteName1}")])[1]
    wait until page contains element  xpath=(//span[contains(text(),"${newtestprojectprefix}-1:${testCaseName}")])[1]
    unselect frame

Fill in title test case name ${testCaseName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    input text  testcase_name  ${testCaseName}
    unselect frame

Fill in Summary test case
    select frame  name=mainframe
    wait until page contains element  workframe
    select frame  name=workframe
    wait until page contains  Summary
    wait until page contains element  xpath=//*[@id="cke_contents_summary"]/iframe
    mouse down  xpath=//*[@id="cke_contents_summary"]/iframe
    mouse up  xpath=//*[@id="cke_contents_summary"]/iframe
    select frame  xpath=//*[@id="cke_contents_summary"]/iframe
    input text  xpath=//body  Summary
    unselect frame

Fill in Preconditions test case
    select frame  mainframe
    wait until page contains element  workframe
    select frame  name=workframe
    wait until page contains  Preconditions
    wait until page contains element  xpath=//*[@id="cke_contents_preconditions"]/iframe
    mouse down  xpath=//*[@id="cke_contents_preconditions"]/iframe
    mouse up  xpath=//*[@id="cke_contents_preconditions"]/iframe
    select frame  xpath=//*[@id="cke_contents_preconditions"]/iframe
    input text  xpath=//body  Preconditionsss
    unselect frame

#Click on Create button test case
    #select frame  mainframe
    #unselect frame

Check create test case open
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Test Case Title
    wait until page contains  Summary
    wait until page contains  Preconditions
    unselect frame

Select test case ${testCaseName} node
    testSpecificationPage.Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains  ${testCaseName}
    wait until page contains element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName}")]/div/a
    double click element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName}")]/div/a
    unselect frame

Create New Sibling ${testCaseName2}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  new_tc
    click element  new_tc
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  testcase_name
    wait until page contains element  do_create_button
    input text  testcase_name  ${testCaseName2}
    click element  do_create_button
    unselect frame

Check New Sibling Was Created
    testSpecificationPage.Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName2}")]/div/a
    page should contain element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName2}")]/div/a
    unselect frame

Select test case ${testCaseName} node and click action button
    testSpecificationPage.Select test case ${testCaseName} node
    testSpecificationPage.Click Actions button

#Click On Export Test Case
    #select frame  mainframe
    #wait until page contains element  workframe
    #select frame  workframe
    #wait until page contains element  export_tc
    #click element  export_tc
    #unselect frame
    #select frame  mainframe
    #wait until page contains element  workframe
    #select frame  workframe
    #wait until page contains element  export
    #click element  export
    #unselect frame

Click On Print View Test Case
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  tcPrinterFriendly
    click element  tcPrinterFriendly
    unselect frame

Click On Create New Version
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  do_create_new_version
    click element  do_create_new_version
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//div/p[contains(text(),"was successfully created" )]
    page should contain element  xpath=//div/p[contains(text(),"was successfully created" )]
    unselect frame

Click On Deactivate This Version
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  deactivate_this_tcversion
    click element  deactivate_this_tcversion
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//div/div[contains(text(),"This version is INACTIVE" )]
    page should contain element  xpath=//div/div[contains(text(),"This version is INACTIVE" )]
    unselect frame

Click On Activate This Version
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  activate_this_tcversion
    click element  activate_this_tcversion
    unselect frame

Click On Add To Test Plans
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  addToTestPlans
    click element  addToTestPlans
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  add2testplan
    wait until page contains element  xpath=//*[@id="item_view"]
    select checkbox  xpath=//form/div/div/table/tbody/tr/td/input[@type="checkbox"]
    click element  add2testplan
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//table[tbody[tr/td[contains(text(),"${TestPlanName}")]]]
    page should contain element  xpath=//table[tbody[tr/td[contains(text(),"${TestPlanName}")]]]
    unselect frame

Click On Execution History
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/div/span/input[@type="button"]
    click element  xpath=//div/div/span/input[@type="button"]
    unselect frame

Edit Test Case ${testCaseNameEdit}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click button  edit_tc
    unselect frame
    testSpecificationPage.Fill in title test case name ${testCaseNameEdit}
    testSpecificationPage.Fill in Summary test case
    testSpecificationPage.Fill in Preconditions test case
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click button  do_update
    unselect frame

Delete Test Case ${NameTestCase}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  delete_tc
    click element  delete_tc
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  do_delete
    wait until page contains element  xpath=//div/p[contains(text(),"Really delete Test Case?")]
    page should contain element  xpath=//div/p[contains(text(),"Really delete Test Case?")]
    click button  do_delete
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  was successfully deleted
    unselect frame

Delete Test Step
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="step_row_1"]/td[5]/img
    click element  xpath=//*[@id="step_row_1"]/td[5]/img
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="step_row_2"]
    page should not contain element  xpath=//*[@id="step_row_1"]
    unselect frame

Check Custom Fields
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//input[@id="doToggleCF"]
    page should contain element  xpath=//input[@id="doToggleCF"]
    wait until page contains element  xpath=//table[tbody/tr/td[contains(.,"${CFLABEL}")]]
    page should contain element  xpath=//table[tbody/tr/td[contains(.,"${CFLABEL}")]]
    unselect frame

Navigator tree expands by one branch
     select frame  mainframe
     #wait until page contains element  treeframe
     select frame  treeframe
     wait until page contains element  xpath=//*[@id="extdd-1"]/img[1]
     wait until page contains   ${newTestProjectName}
     #wait until page contains element   xpath=//*[@id="extdd-9"]/span
     click element   xpath=//*[@id="extdd-1"]/img[1]
     #page should contain element  xpath=//*[@id="extdd-6"]/span
     #page should contain element  xpath=//*[@id="extdd-9"]/span
     unselect frame

Click on black arrow
     select frame  mainframe
     #wait until page contains element  treeframe
     select frame  treeframe
     wait until page contains element  xpath=//*[@id="extdd-1"]/img[1]
     wait until page contains   ${newTestProjectName}
     #wait until page contains element   xpath=//*[@id="extdd-9"]/span
     #page should contain element  xpath=//*[@id="extdd-6"]/span
     #page should contain element  xpath=//*[@id="extdd-9"]/span
     wait until page contains    ${testSuiteName}
     wait until page contains    ${testSuiteName1}
     click element   xpath=//*[@id="extdd-1"]/img[1]
     unselect frame

Check black arrow
     select frame  mainframe
     #wait until page contains element  treeframe
     select frame  treeframe
     wait until page contains element  xpath=//*[@id="extdd-1"]/img[1]
     wait until page contains   ${newTestProjectName}
     #wait until page contains element   xpath=//*[@id="extdd-9"]/span
     page should not contain   ${testSuiteName}
     page should not contain  ${testSuiteName1}
    # wait until page contains    ${testSuiteName}
    # wait until page contains    ${testSuiteName1}
     #click element   xpath=//*[@id="extdd-1"]/img[1]
     unselect frame

Check white arrow
     select frame  mainframe
     select frame  treeframe
     wait until page contains element  xpath=//*[@id="extdd-1"]/img[1]
     wait until page contains   ${newTestProjectName}
     page should contain  ${newTestProjectName}
     page should not contain  ${testSuiteName}
     #wait until page contains    ${testSuiteName}
     page should not contain  ${testSuiteName1}
     #wait until page contains    ${testSuiteName1}
     #click element   xpath=//*[@id="extdd-1"]/img[1]
     #page should contain element  xpath=//*[@id="extdd-6"]/span
     unselect frame

Create TS ${testSuiteName} ${newTestProjectName}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Select test project ${newTestProjectName} node
    testSpecificationPage.Click Actions button
    testSpecificationPage.Click new test suite
    testSpecificationPage.Fill name for ts: ${testSuiteName} and submit

Create TC ${testSuiteName} in TS ${testCaseName}
    testSpecificationPage.I am here
    testSpecificationPage.Select test suite ${testSuiteName} node
    testSpecificationPage.Click Actions button
    testSpecificationPage.Click new test case
    testSpecificationPage.Fill name for tc: ${testCaseName} and submit

Click on the white arrow on the left side of the Test Project
    testSpecificationPage.Navigator tree expands by one branch
    testSpecificationPage.Check white arrow

Click on the black arrow on the left side of the Test Project
    testSpecificationPage.Click on black arrow
    testSpecificationPage.Check black arrow

Add Test Cases to the Test Plan
    testSpecificationPage.Select test case ${testCaseName2} node and click action button
    testSpecificationPage.Click On Add To Test Plans
    testSpecificationPage.Select test case ${testCaseName3} node and click action button
    testSpecificationPage.Click On Add To Test Plans
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Click On Add To Test Plans

Create New Version of TestCase
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Click On Create New Version

Fill in the fields and create test suite
    testSpecificationPage.Create Test Suite Button
    testSpecificationPage.Fill In The Fields ${testSuiteName} ${testDescription}

Fill informations test case ${testCaseName} and create
    testSpecificationPage.Check create test case open
    testSpecificationPage.Fill in Summary test case
    testSpecificationPage.Fill in Preconditions test case
    testSpecificationPage.Fill name for tc: ${testCaseName} and submit
