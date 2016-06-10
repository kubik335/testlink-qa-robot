*** Settings ***

Documentation  The test case controls editing mode for Build.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Build with name ${buildName}

Test Teardown  Run keywords  testlink.Delete Build ${buildName2}
...            AND           testlink.Delete Test Plan Management  ${TestPlanName}
...            AND           testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser

*** Variables ***
${buildName2}  buildName64_1
${buildName}  buildName64
${buildDescription}  DescriptionOfBuild64
${TestPlanName}  testPlan64
${newTestProjectName}  testProject64
${newTestProjectPrefix}  tp64
${TestPlanDescription}  DescriptionOfTestPlan64

*** Test Cases ***
Edit Build
        headerPage.Go to index page and change testproject
        desktopPage.Go to link Builds / Releases
        buildsReleases.Select Build ${buildName}
        testlink.Edit Build Info and Save Changes
        buildsReleases.Check if Build was created ${buildName2}


