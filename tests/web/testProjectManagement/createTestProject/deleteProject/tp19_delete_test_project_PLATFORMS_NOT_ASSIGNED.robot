*** Settings ***

Documentation  A test case for deleting test projects that have PLATFORMS DEFINED, BUT NOT ASSIGNED TO ANY TEST PLANS.


Resource  ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Platform ${PlatformName}

Test Teardown  Run keywords    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             close browser

*** Variables ***
${newTestProjectName}  testProject19
${newTestProjectPrefix}  tp19
${newTestProjectDescription}  DesctiptioneOfTestProject19
${PlatformName}  Platform19
${TestPlanName}  testPlan19
${TestPlanDescription}  DescriptionOfTestPlan19

*** Test Cases ***

Delete Test Project No Platfroms Assigned
     testlink.Check There Is No Platforms Assigned
