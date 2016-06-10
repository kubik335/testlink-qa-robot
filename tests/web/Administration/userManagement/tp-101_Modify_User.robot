*** Settings ***
Documentation  The test case made to check editing mode of the user.

Resource       ../../../../resource/testlink.robot

Test Setup      testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close Browser

*** Variables ***
${login}  vojta.svoboda
${fname}  karel
${lname}  karel
${email}  email@email.com
${newTestProjectName}           testProject101
${newTestProjectPrefix}         tp101
${newTestProjectDescription}    Description101

*** Test Cases ***
Edit user test case

    testlink.Start editing user
    testlink.Edit user
