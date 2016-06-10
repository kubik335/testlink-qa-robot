*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject


Test Teardown  Run keywords     testlink.Delete New Test Suite
...             AND             testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             testlink.Check that test has been deleted
...            AND              Close browser

*** Variables ***

${newTestProjectName}  testProject80
${newTestProjectPrefix}  tp80
${testSuiteName}    tsuite80
${testDescription}  testDescription80

*** Test Cases ***

Create Test Suite Easy
        testlink.Controll Warning Message And Create Test Suite
        testlink.Check New Test Suite


