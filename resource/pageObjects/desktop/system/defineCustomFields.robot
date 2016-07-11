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
${BROWSER}      ff


*** Keywords ***

Check Define Custom Fields
    select frame  mainframe
    wait until page contains  Custom fields
    unselect frame

Click create Custom Field
    select frame  mainframe
    double click element  xpath=//input[@name="create_cfield"]
    unselect frame

Input information about Custom Field
    select frame  mainframe
    input text  cf_name  ${CFNAME}
    input text  cf_label  ${CFLABEL}
    double click element  xpath=//input[@name="do_update"]
    unselect frame

Check custom field
    select frame  mainframe
    #Click Button  do_update
    page should contain  ${CFNAME}
    unselect frame

Check edited custom field
    #Click Button  do_update
    select frame  mainframe
    wait until page contains  ${NEWCFNAME}
    page should contain  ${NEWCFNAME}
    unselect frame

Select Custom Field
    select frame  mainframe
    click link  ${CFNAME}
    unselect frame

Edit Custom Fields
    select frame  mainframe
    input text  cf_name  ${NEWCFNAME}
    #change (Available for)
    click element  xpath=//*[@id="combo_cf_node_type_id"]
    click element  xpath=//*[@id="combo_cf_node_type_id"]/option[3]
    #change (Type)
    click element  xpath=//*[@id="combo_cf_type"]
    click element  xpath=//*[@id="combo_cf_type"]/option[4]
    #change[Display on test execution]
    click element  xpath=//*[@id="cf_show_on_execution"]
    click element  xpath=//*[@id="cf_show_on_execution"]/option[2]
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/input[@name="do_update"]
    double click element  xpath=//div/input[@name="do_update"]
    unselect frame

Update Custom Field
    select frame  mainframe
    wait until page contains element  xpath=//div/input[@name="do_update"]
    click button  Update
    unselect frame

Select and delete EDITED Custom Field
    select frame  mainframe
    click link  ${NEWCFNAME}
    click button  do_delete
    wait until page contains  Yes
    click button  Yes
    unselect frame

Select and delete Custom Field ${CFNAME}
    select frame  mainframe
    click link  ${CFNAME}
    click button  do_delete
    wait until page contains  Yes
    click button  Yes
    unselect frame

Check if Custom Field has been deleted
    select frame  mainframe
    page should not contain  ${CFNAME}
    unselect frame

Check if EDITED Custom Field has been deleted
    select frame  mainframe
    page should not contain  ${NEWCFNAME}
    unselect frame


Creating Define Custom Fields
    defineCustomFields.Check Define Custom Fields
    defineCustomFields.Click create Custom Field
    defineCustomFields.Input information about Custom Field
    defineCustomFields.Check custom field

Edit information CF and Check New CF
    defineCustomFields.Check Define Custom Fields
    defineCustomFields.Select Custom Field
    defineCustomFields.Edit Custom Fields
    #defineCustomFields.Update Custom Field
    defineCustomFields.Check Define Custom Fields
    defineCustomFields.Check edited custom field

Delete CF ${CFNAME}
    defineCustomFields.Select and delete Custom Field ${CFNAME}
    defineCustomFields.Check if Custom Field has been deleted