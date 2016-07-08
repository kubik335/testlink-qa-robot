*** Settings ***
Documentation  Test Suite controls assigning roles to existing users, editing of the user.
...            Test Case tp100 Create new user is used for creating new user.
...            In testlnik the user created cannot be easily deleted.
...            Due to this fact tp100 is commented and will be used by testers if only needed.


Resource       ../../../resource/testlink1.robot


Suite Setup  Run keywords        Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND              Create New Test Plan ${TestPlanName}
...             AND              Create and check role ${role} in user management


Suite Teardown  Run keywords     HeaderPage Go to ${userManagement}
...             AND              userManagement.Delete role ${role}
...             AND              Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND              Close all browsers


*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${user}                             vojta.svoboda
${fname}                            karel
${lname}                            karel
${email}                            email@email.com
${pass}                             vojta123
${role}                             novaRole
${newTestProjectName}               userManagement
${newTestProjectPrefix}             userManagement
${TestPlanName}                     testPlan
${TestPlanDescription}              Description

*** Test Cases ***

#100 Create new user
    #Start creating new user
    #Fill all info about user and submit
    #Check that user exists

101 Edit user test case
    Start editing user
    Edit user

102 Assign Test Project and Test Plan roles
    HeaderPage Go to ${userManagement}
    Click bookmark Assign Test Project roles
    Change user role in test project
    Click Bookmark Assign Test Plan roles
    Change user role in test plan