*** Settings ***

Documentation  This Test Suite with several Test Cases is used for creating build with values without/with release date
...            and that could not generate error/conflicts while creating. Another Test Cases creates build from another
...            existing build(No conflicts). Also there is a Test Case, that controls editing mode for Build.

Resource    ../../../resource/testlink1.robot

Suite Setup  Run keywords    Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND          headerPage.Go to index page and change testproject
...             AND          Create New Test Plan ${TestPlanName}

Suite Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND            Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           buildManagement
${newTestProjectPrefix}         build
${buildName}                    buildName
${buildName1}                   buildName1
${buildName2}                   buildName2
${buildName3}                   buildName3
${buildDescription}             DescriptionOfBuild
${TestPlanName}                 testPlan
${TestPlanDescription}          DescriptionOfTestPlan

*** Test Cases ***

61 Create Build - "Easy" - No release date
    Create Build with name ${buildName}

62 Create Build "EASY" With Release Date
    headerPage.Go to index page and change testproject
    Start creating build with warning
    Create Build With Release Date And Save ${buildName1}
    Check that Build is created ${buildName1}

63 Create Build - "Easy" - from existing build
    headerPage.Go to index page and change testproject
    Create ${buildName2} from existing ${buildName1}

64 Edit Build
    Change Test Project and go to ${buildReleases} ${checkBuildReleases}
    Select Build ${buildName2}
    Edit Build Info and Save Changes
    Check if Build was created ${buildName3}

66 Delete Build
    Delete build ${buildName}