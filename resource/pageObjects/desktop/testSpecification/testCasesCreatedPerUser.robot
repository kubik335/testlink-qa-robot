*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

#Check Test Cases Created Per User
    #select frame  mainframe
    #wait until page contains  Test Cases created per User
    #unselect frame