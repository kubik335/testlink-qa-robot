*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

#Check Assign User Roles
    #select frame  mainframe
    #wait until page contains  Assign Test Project roles
    #wait until page contains element  do_update
    #unselect frame
