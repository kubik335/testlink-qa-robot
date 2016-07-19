*** Settings ***

Documentation  This is the resource file containing all methods based part of desktop which contains header
Library        Selenium2Library

*** Variables ***


*** Keywords ***

I am here
    select frame  mainframe
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"View Users")]
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"View roles")]
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"Assign Test Project roles")]
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"Assign Test Plan roles")]
    wait until page contains element  css=div.workBack
    wait until page contains element  doCreate
    wait until page contains element  export
    unselect frame

Wait until page contains view users content
    select frame  mainframe
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"View Users")]
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"View roles")]
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"Assign Test Project roles")]
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"Assign Test Plan roles")]
    wait until page contains element  css=div.workBack
    wait until page contains element  doCreate
    wait until page contains element  export
    unselect frame

Click desired user
    select frame  mainframe
    click link  ${user}
    unselect frame

Fill inputs for editing user and submit
    select frame  mainframe
    clear element text  firstName
    clear element text  lastName
    clear element text  emailAddress
    input text   firstName  ${fname}
    input text   lastName  ${lname}
    input text   emailAddress  ${email}
    select from list by label  rights_id  guest
    select from list by label  locale  Czech
    select from list by label  authentication  Default(DB)
    checkbox should be selected  user_is_active
    click element  do_update
    unselect frame

Check all fields for editing user are availiable
    select frame  mainframe
    wait until page contains element  firstName
    wait until page contains element  lastName
    wait until page contains element  emailAddress
    wait until page contains element  rights_id
    wait until page contains element  locale
    wait until page contains element  authentication
    wait until page contains element  do_update
    wait until page contains element  user_is_active
    wait until page contains element  cancel
    wait until page contains element  do_reset_password
    unselect frame

Create role ${role}
    page should not contain element  xpath=//a[contains(., "${role}")]
    select frame  mainframe
    wait until page contains element  xpath=//table
    wait until page contains element  doCreate
    click element  doCreate
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//input[@name="rolename"]
    input text  xpath=//input[@name="rolename"]  ${role}
    wait until page contains element  xpath=//fieldset[legend[text()="Test Project"]]/input[1]
    select checkbox  xpath=//fieldset[legend[text()="Test Project"]]/input[1]
    wait until page contains element  xpath=//input[@type="submit"]
    click element  xpath=//input[@type="submit"]
    wait until page does not contain element  xpath=//input[@name="rolename"]
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//table
    wait until element contains  xpath=//table  ${role}
    unselect frame

Click bookmark ${bookmark}
    select frame  mainframe
    wait until page contains element  xpath=//div[@class="tabMenu"]/span[contains(., "${bookmark}")]
    click element  xpath=//div[@class="tabMenu"]/span[contains(., "${bookmark}")]
    unselect frame

Change user role in test project
    select frame  mainframe
    wait until page contains element  xpath=//table[@id="item_view"]
    wait until page contains element  xpath=//tr[*[contains(text(),"tester (tester tesena)")]]//select
    select from list by label  xpath=//tr[*[contains(text(),"tester (tester tesena)")]]//select  ${role}
    wait until page contains element  do_update
    click element  do_update
    unselect frame
    select frame  mainframe
    wait until page contains  User Roles updated
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//table[@id="item_view"]
    wait until page contains element  xpath=//tr[*[contains(text(),"tester (tester tesena)")]]//select
    select from list by label  xpath=//tr[*[contains(text(),"tester (tester tesena)")]]//select  tester
    wait until page contains element  do_update
    click element  do_update
    unselect frame

Change user role in test plan
    select frame  mainframe
    wait until page contains element  xpath=//table[@id="item_view"]
    wait until page contains element  xpath=//tr[*[contains(text(),"tester (tester tesena)")]]//select
    select from list by label  xpath=//tr[*[contains(text(),"tester (tester tesena)")]]//select  ${role}
    wait until page contains element  do_update
    click element  do_update
    unselect frame
    select frame  mainframe
    wait until page contains  User Roles updated
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//table[@id="item_view"]
    wait until page contains element  xpath=//tr[*[contains(text(),"tester (tester tesena)")]]//select
    select from list by label  xpath=//tr[*[contains(text(),"tester (tester tesena)")]]//select  tester
    wait until page contains element  do_update
    click element  do_update
    unselect frame

Delete role ${role}
    userManagement.Click bookmark View roles
    select frame  mainframe
    wait until page contains element  xpath=//tr[contains(.,"${role}")]//img[@title="Delete role"]
    click element  xpath=//tr[contains(.,"${role}")]//img[@title="Delete role"]
    wait until page contains  You are going to delete: ${role}
    wait until page contains  Yes
    click button  Yes
    unselect frame

Edit user
    [Tags]  tp101
    userManagement.Check all fields for editing user are availiable
    userManagement.Fill inputs for editing user and submit

Choose bookmark and create role ${role}
    userManagement.Click bookmark View roles
    userManagement.Create role ${role}

Choose desired user
    userManagement.Wait until page contains view users content
    userManagement.Click desired user