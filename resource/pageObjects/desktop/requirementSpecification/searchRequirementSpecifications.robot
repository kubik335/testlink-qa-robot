*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

#Check Search Requirement Specifications
    #select frame  name=mainframe
    #wait until page contains element  workframe
    #select frame  name=workframe
    #wait until page contains  Requirement Specification Search Page
    #unselect frame
