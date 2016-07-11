*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}      ff


*** Keywords ***
Check Page Add/Remove TC ${PlatformName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//input[@name="doAddRemove"]
    wait until page contains element  xpath=//tbody[tr/td[contains(text(),"${PlatformName}")]]
    wait until page contains element  testerID
    unselect frame


Assign TC to user ${Username}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    select from list by label  testerID  ${Username}
    unselect frame

Assign TC to platform ${PlatformName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click element  xpath=//tr[td[text()="${PlatformName}"]]//input[1]
    click element  xpath=//input[@name="doAddRemove"]
    unselect frame

Check TC were Assigned
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//tr[td[text()="${PlatformName}"]]//input[@type="checkbox"]
    wait until page contains element  xpath=//tr[td[text()="${PlatformName1}"]]//input[@type="checkbox"]
    unselect frame

Show Test Cases
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    click button  show_whole_test_spec
    unselect frame

Unassign TC from ${PlatformName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click element  xpath=//tr[td[text()="${PlatformName}"]]//input[@type="checkbox"]
    click element  xpath=//input[@name="doAddRemove"]
    unselect frame

Assign to user ${Username} & platform ${PlatformName} TC
    addRemoveTestCases.Show Test Cases
    wait until keyword succeeds  1min  0  addRemoveTestCases.Check Page Add/Remove TC ${PlatformName}
    addRemoveTestCases.Assign TC to user ${Username}
    addRemoveTestCases.Assign TC to platform ${PlatformName}

Unassign platform and its testCases ${PlatformName}
    addRemoveTestCases.Show Test Cases
    wait until keyword succeeds  1min  0  addRemoveTestCases.Check Page Add/Remove TC ${PlatformName}
    addRemoveTestCases.Check TC were Assigned
    addRemoveTestCases.Unassign TC from ${PlatformName}
