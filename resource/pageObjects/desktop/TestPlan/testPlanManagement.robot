*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***


*** Keywords ***

Create Test Plan Management
    select frame  mainframe
    wait until page contains element  create_testplan
    click button  create_testplan
    unselect frame

Check Test Plan Management is Created ${TestPlanName}
    select frame  mainframe
    wait until page contains  Test Plan Management
    wait until page contains element  xpath=//a[contains(text()," ${TestPlanName} ")]
    unselect frame


