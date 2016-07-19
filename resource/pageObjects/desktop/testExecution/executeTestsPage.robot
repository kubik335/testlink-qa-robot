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
    wait until page contains element  xpath=//h1[text()="Execute Tests"]
    wait until page contains element  xpath=//span[contains(text(),"Settings")]
    wait until page contains element  xpath=//span[contains(text(),"Filters")]
    wait until page contains element  xpath=//input[@value="Apply"]
    wait until page contains element  xpath=//input[@value="Reset Filters"]
    wait until page contains element  xpath=//input[@value="Advanced Filters"]
    wait until page contains element  xpath=//input[@value="Expand tree"]
    wait until page contains element  xpath=//input[@value="Collapse tree"]
    wait until page contains element  tree_div
    unselect frame

Execute Test Case
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/textarea[@style="resize:both;"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div[@class="resultBox"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]
    input text  xpath=//div/form/div/table/tbody/tr/td/textarea[@style="resize:both;"]  New Description
    select from list by value  xpath=//div/form/div/table/tbody/tr/td/div/select  p
    input text  execution_duration  1010
    click element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]
    wait until page contains element  xpath=//div/form/div/div[contains(text(),"Build")][contains(text(),"${buildName}")]
    page should contain element  xpath=//div/form/div/div[contains(text(),"Build")][contains(text(),"${buildName}")]
    unselect frame

Select test case ${testCaseName} node
    select frame  mainframe
    select frame  treeframe
    wait until page contains  ${testCaseName}
    wait until page contains element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName}")]/div/a
    double click element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName}")]/div/a
    unselect frame

Execute Test Case Passed
    executeTestsPage.Select test case ${testCaseName} node
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until keyword succeeds  1min  0  executeTestsPage.I am here Execute Tests Frame
    select from list by value  xpath=//div/form/div/table/tbody/tr/td/div/select  p
    input text  execution_duration  1010
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[7]/td/select  p
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[10]/td/select  p
    unselect frame

Click on Save and move to next
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save and move to next"]
    click element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save and move to next"]
    unselect frame

Click on Save execution button
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]
    click element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]
    unselect frame

Check Move to Next Function ${testCaseName}
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/form/div[contains(.,"${testCaseName}")]
    page should contain element  xpath=//div/form/div[contains(.,"${testCaseName}")]
    unselect frame

Check That Passed Test Was Saved
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//span[@class="light_passed"][contains(text(),"${testCaseName}")]
    page should contain element  xpath=//span[@class="light_passed"][contains(text(),"${testCaseName}")]
    unselect frame

Execute Test Case Failed
    executeTestsPage.Select test case ${testCaseName2} node
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until keyword succeeds  1min  0  executeTestsPage.I am here Execute Tests Frame
    select from list by value  xpath=//div/form/div/table/tbody/tr/td/div/select  f
    input text  execution_duration  1010
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[7]/td/select  f
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[10]/td/select  f
    unselect frame

Check That Failed Test Was Saved
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//span[@class="light_failed"][contains(text(),"${testCaseName2}")]
    page should contain element  xpath=//span[@class="light_failed"][contains(text(),"${testCaseName2}")]
    unselect frame

Execute Test Case Blocked
    executeTestsPage.Select test case ${testCaseName3} node
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until keyword succeeds  1min  0  executeTestsPage.I am here Execute Tests Frame
    select from list by value  xpath=//div/form/div/table/tbody/tr/td/div/select  b
    input text  execution_duration  1010
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[7]/td/select  b
    select from list by value  xpath=//div/form/div/div/table/tbody/tr[10]/td/select  b
    unselect frame

Check That Blocked Test Was Saved
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//span[@class="light_blocked"][contains(text(),"${testCaseName3}")]
    page should contain element  xpath=//span[@class="light_blocked"][contains(text(),"${testCaseName3}")]
    unselect frame

Check Test Suite Status
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//span[contains(.,"${newTestProjectName} / ${TestPlanName}")][span[@class="light_passed"]][span[@class="light_failed"]][span[@class="light_blocked"]]
    page should contain element  xpath=//span[contains(.,"${newTestProjectName} / ${TestPlanName}")][span[@class="light_passed"]][span[@class="light_failed"]][span[@class="light_blocked"]]
    unselect frame

I am here Execute Tests Frame
    wait until page contains element  xpath=//div/form/div/div/table/tbody/tr/td/select
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div[@class="resultBox"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@type="submit"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save and move to next"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@value="Save execution"]

Expanding tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  expand_tree
    click element  expand_tree
    unselect frame

Execute Test Cases
    executeTestsPage.Expanding tree
    executeTestsPage.Select test case ${testCaseName} node
    executeTestsPage.Execute Test Case Passed
    executeTestsPage.Click on Save and move to next
    executeTestsPage.Check That Passed Test Was Saved
    executeTestsPage.Check Move to Next Function ${testCaseName2}
    executeTestsPage.Execute Test Case Failed
    executeTestsPage.Click on Save and move to next
    executeTestsPage.Check That Failed Test Was Saved
    executeTestsPage.Check Move to Next Function ${testCaseName3}
    executeTestsPage.Execute Test Case Blocked
    executeTestsPage.Click on Save execution button
    executeTestsPage.Check That Blocked Test Was Saved
    executeTestsPage.Check Test Suite Status