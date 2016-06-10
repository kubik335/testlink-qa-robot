*** Settings ***

Documentation  This test case is checking correct/incorrect logging to the testlab.tesena.com/testlink.

Resource       ../../../../resource/testlink.robot

Test Setup      testlink.Login as admin correct

Test Teardown   close all browsers


*** Test Cases ***

Login

    testlink.Login as admin incorrect
    testlink.Login as admin with empty password field


