*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resource/testlink.robot

#Test Setup  #testlink.Create new Test Project  ${newTestProjectName}  ${newTestProjectPrefix} testlink.Create new Test Project  ${newTestProjectName1}  ${newTestProjectPrefix1}


Test Setup  Run keywords        testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND             testlink.Go to index page
...             AND             testlink.Create TP ${newTestProjectName1} ${newTestProjectPrefix1}

Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName1}  ${newTestProjectPrefix1}
...             AND             testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser

*** Variables ***
${newTestProjectName}               testProject5
${newTestProjectPrefix}             tp5
${newTestProjectName1}               testProject5_1
${newTestProjectPrefix1}             tp5_1

*** Test Cases ***

Validation of changing the Test Project
    headerPage.Go to index page and change testproject

