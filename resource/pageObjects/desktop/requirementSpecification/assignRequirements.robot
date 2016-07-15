*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

#Check Assign Requirements
    #select frame  mainframe
    #wait until page contains element  workframe
    #select frame  workframe
    #wait until page contains  Assign Requirements to Test Case
    #unselect frame
