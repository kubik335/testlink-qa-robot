*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

Wait until page contains all elements
    select frame  mainframe
    wait until page contains element  active
    wait until page contains element  doActionButton
    unselect frame

Unselect Checkbox Availibility Active
    testProjectEdit.Wait until page contains all elements
    select frame  mainframe
    checkbox should be selected  xpath=//input[@name="active"]
    unselect checkbox  xpath=//input[@name="active"]
    click element  doActionButton
    unselect frame


