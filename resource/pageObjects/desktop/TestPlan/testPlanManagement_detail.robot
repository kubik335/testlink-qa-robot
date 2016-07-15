*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

Input Name
    [Arguments]   ${TestPlanName}
    select frame  mainframe
    wait until page contains element  testplan_name
    input text  testplan_name  ${TestPlanName}
    unselect frame

Input Description
    select frame  name=mainframe
    wait until page contains  Description
    wait until page contains element  xpath=//iframe[@title="Rich text editor, notes"]
    mouse down  xpath=//iframe[@title="Rich text editor, notes"]
    mouse up  xpath=//iframe[@title="Rich text editor, notes"]
    #click element  cke_8_label
    select frame  xpath=//iframe[@title="Rich text editor, notes"]
    input text  xpath=//body  ${TestPlanDescription}
    #input text  xpath=//*[@id="cke_contents_notes"]/textarea  ${TestPlanDescription}
    unselect frame

wait until page contains all checkboxes from existing Test Plan
    select frame  mainframe
    wait until page contains  Copy User Roles
    wait until page contains  Copy Attachments
    wait until page contains  Copy Test Cases
    wait until page contains  Copy Builds
    wait until page contains  Copy Platforms Links
    wait until page contains  Copy Milestones
    unselect frame

Select Checkbox Active
    select frame  mainframe
    wait until page contains element  active
    select checkbox  active
    unselect frame

Select Checkbox Public
    select frame  mainframe
    wait until page contains element  is_public
    select checkbox  is_public
    unselect frame

unselect checkbox Public
    select frame  mainframe
    wait until page contains element  is_public
    unselect checkbox  is_public
    unselect frame

unselect checkbox Active
    select frame  mainframe
    wait until page contains element  active
    unselect checkbox  active
    unselect frame

unselect checkbox Copy User Roles
    select frame  mainframe
    wait until page contains element  copy_user_roles
    unselect checkbox  copy_user_roles
    unselect frame

unselect checkbox Copy Test Cases
    select frame  mainframe
    wait until page contains element  copy_tcases
    unselect checkbox  copy_tcases
    unselect frame

unselect checkbox Copy Attachements
    select frame  mainframe
    wait until page contains element  copy_attachments
    unselect checkbox  copy_attachments
    unselect frame

unselect checkbox Copy Builds
    select frame  mainframe
    wait until page contains element  copy_builds
    unselect checkbox  copy_builds
    unselect frame

unselect checkbox Copy Platforms Links
    select frame  mainframe
    wait until page contains element  copy_platforms_links
    unselect checkbox  copy_platforms_links
    unselect frame

unselect checkbox Copy Milestones
    select frame  mainframe
    wait until page contains element  copy_milestones
    unselect checkbox  copy_milestones
    unselect frame

Click Create button to finish Test Plan Management
    select frame  mainframe
    wait until page contains element  do_create
    click button  Create
    unselect frame

#Warning Message Creating Same Test Plan Management
    #select frame  mainframe
    #wait until page contains  There is already a Test Plan with this name. Please choose another name!
    #unselect frame

Click Button Delete Test Plan Management
    [Arguments]  ${TestPlanNameToDelete}
    select frame  mainframe
    wait until page contains  ${TestPlanNameToDelete}
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanNameToDelete}')]]/td[last()]/img[1]
    unselect frame

Click Button Assign Roles Test Plan Management
    [Arguments]  ${TestPlanName}
    select frame  mainframe
    wait until page contains  ${TestPlanName}
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td/a/img[@title="Assign roles"]
    unselect frame

Confirm Delete Test Plan Management
    select frame  mainframe
    click button  Yes
    unselect frame

Check Test Plan Management Deleted
    [Arguments]  ${TestPlanNameToDelete}
    select frame  mainframe
    wait until page does not contain  ${TestPlanNameToDelete}
    unselect frame

Create from existing Test Plan?
    select frame  mainframe
    wait until page contains  Create from existing Test Plan?
    click element  xpath=//div/form/table/tbody/tr/td/select/option[.='${TestPlanName}']
    unselect frame
    select frame  mainframe
    wait until page contains element  copy_milestones
    wait until page contains element  copy_platforms_links
    wait until page contains element  copy_builds
    wait until page contains element  copy_attachments
    wait until page contains element  copy_tcases
    wait until page contains element  copy_user_roles
    wait until page contains element  active
    wait until page contains element  is_public
    unselect frame

Order By Name
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[2]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[2]
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[2]
    unselect frame

Order By Test Case
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/thead/tr/th[3]/img
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:8%;"][contains(text(),"1")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:8%;"][contains(text(),"1")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[3]/img
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:8%;"][contains(text(),"0")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:8%;"][contains(text(),"0")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[3]/img
    unselect frame

Order By Test Build
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/thead/tr/th[4]/img
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:6%;"][contains(text(),"1")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:6%;"][contains(text(),"1")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[4]/img
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:6%;"][contains(text(),"0")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:6%;"][contains(text(),"0")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[4]/img
    unselect frame

Check Test Plan Is Active
    select frame  mainframe
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Active (click to set inactive)"]]
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Active (click to set inactive)"]]
    unselect frame

Click On Bulb Icon
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Active (click to set inactive)"]]/input
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Inactive (click to set active)"]]/input
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Inactive (click to set active)"]]/input
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Active (click to set inactive)"]]/input
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Inactive (click to set active)"]]/input
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Inactive (click to set active)"]]/input
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Inactive (click to set active)"]]/input
    unselect frame
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Inactive (click to set active)"]]/input
    unselect frame

Edit Test Plan
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[1]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[1]
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[span//text()[contains(.,"[ID:")]]/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[span//text()[contains(.,"[ID:")]]/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    click element  xpath=//div/div/form/div/table/tbody/tr/td[span//text()[contains(.,"[ID:")]]/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    unselect frame
    select frame  mainframe
    wait until page contains element  testplan_name
    wait until page contains element  do_update
    input text  testplan_name  ${EditTestPlanName}
    unselect frame
    testPlanManagement_detail.Input Description
    select frame  mainframe
    click element  do_update
    unselect frame

Check Updated Test Plan
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${EditTestPlanName}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${EditTestPlanName}")][contains(text()," ")]
    unselect frame

Make all Test Plan Active/Inactive
    [Tags]  56
    testPlanManagement_detail.Check Test Plan Is Active
    testPlanManagement_detail.Click On Bulb Icon
    testPlanManagement_detail.Check Test Plan Is Active

Edit And Check Test Plan
    [Tags]  56
    testPlanManagement_detail.Edit Test Plan
    testPlanManagement_detail.Check Updated Test Plan

Fill in all fields ${TestPlanName}
    testPlanManagement_detail.Input Name  ${TestPlanName}
    testPlanManagement_detail.Input Description
    testPlanManagement_detail.Select Checkbox Active
    testPlanManagement_detail.Select Checkbox Public
    testPlanManagement_detail.Click Create button to finish Test Plan Management

Create Test Plan with Warning Message ${TestPlanName}
    testPlanManagement_detail.Input Name  ${TestPlanName}
    testPlanManagement_detail.Create from existing Test Plan?
    testPlanManagement_detail.Select Checkbox Active
    testPlanManagement_detail.Click Create button to finish Test Plan Management

Create Test Plan with unselected checkboxes ${TestPlanName}
    testPlanManagement_detail.Input Name  ${TestPlanName}
    testPlanManagement_detail.Create from existing Test Plan?
    testPlanManagement_detail.unselect checkbox Copy User Roles
    testPlanManagement_detail.unselect checkbox Copy Attachements
    testPlanManagement_detail.unselect checkbox Copy Test Cases
    testPlanManagement_detail.unselect checkbox Copy Builds
    testPlanManagement_detail.unselect checkbox Copy Platforms Links
    testPlanManagement_detail.unselect checkbox Copy Milestones
    testPlanManagement_detail.unselect checkbox Active
    testPlanManagement_detail.unselect checkbox Public
    testPlanManagement_detail.Click Create button to finish Test Plan Management

Order by Name, TC, Build
    testPlanManagement_detail.Order By Name
    testPlanManagement_detail.Order By Test Case
    testPlanManagement_detail.Order By Test Build

Delete and Check ${TestPlanNameToDelete}
     testPlanManagement_detail.Click Button Delete Test Plan Management  ${TestPlanNameToDelete}
     testPlanManagement_detail.Confirm Delete Test Plan Management
     testPlanManagement_detail.Check Test Plan Management Deleted  ${TestPlanNameToDelete}