*** Settings ***
Documentation  A test case for creating new user.
...            In testlnik the user created cannot be easily deleted.
...            Due to this fact tp100 is commented and will be used by testers if only needed.

#Resource       ../../../../resource/testlink.robot

#Test Teardown  Close browser

*** Variables ***
${login}  vojta.svoboda
${fname}  Vojtěch
${lname}  Svoboda
${pass}  vojta123
${email}  vojtech.svoboda@tesena.com

*** Test Cases ***
#Create new user test case
    #testlink.Login as admin correct
    #testlink.Start creating new user
    #testlink.Fill all info about user and submit
    #testlink.Check that user exists
