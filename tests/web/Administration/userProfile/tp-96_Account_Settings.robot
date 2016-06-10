*** Settings ***

Documentation  A test case for editing MySettings(account settings).
...            Test case verifies the correct inputing of information to the fields.

Resource       ../../../../resource/testlink.robot

Test Teardown  Run keywords  testlink.Set Personal data in My Settings back
...            AND           testlink.Set Personal password in My Settings back
...            AND           Close browser


*** Variables ***

${ChangedName}  SomeChangedName
${NewTestEmailAdress}  testemailadress@honzaknownothing.com
${NewTestLastName}     testLastName
${NewTestFirstName}    testFirstName
${NewTestPassword}     testPassword

*** Test Cases ***

Change password in MySettings

     testlink.Login as admin correct
     testlink.Validate settings fields
     testlink.Change Personal password in My Settings
     testlink.Input Personal data in settings





