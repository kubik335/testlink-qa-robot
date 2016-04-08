*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create Test Suite
...             AND         testlink.Check New Test Suite
...             AND         testlink.Go to index page

Test Teardown  Run keywords    testlink.Go to index page
...             AND              testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
#...             AND             testlink.Delete New Test Suite
#...             AND             testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
#...             AND             testlink.Check that test has been deleted
...             AND              Close browser

*** Variables ***

${newTestProjectName}  NewNamedProject
${newTestProjectPrefix}  voj
${testSuiteName}    suiteTestt
${testDescription}  testDescriptionn
${testDescription}
${testDescription}
${testDescription}


*** Test Cases ***

Create Test Case

    desktopPage.Go to Test Specification (mainframe)
    testSpecificationPage.I am here
    testSpecificationPage.Select test suite ${testSuiteName} node
    testlink.Start Creating Test Case
   # testlink.Fill informations test case
  #  testSpecificationPage.Click new test case
  #  testSpecificationPage.Move suite ${suite1} to suite ${suite3}
    #testlink.Click to Test Suite


