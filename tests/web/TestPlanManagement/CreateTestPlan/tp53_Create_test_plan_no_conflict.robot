*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Teardown  Run keywords  testlink.Delete Test Plan Management  ${TestPlanManagementName}
...            AND           Close browser


*** Variables ***

${TestPlanManagementName}  TestplanNumberOne
${TestPlanManagementDescription}  DescriptionDescription

*** Test Cases ***

Create new test plan

     testlink.Login as admin correct
     testlink.Create New Test Plan ${TestPlanManagementName}



