*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

#Check Keyword Management
    #select frame  name=mainframe
    #wait until page contains  Keyword Management
    #wait until page contains element  create_keyword
    #unselect frame
