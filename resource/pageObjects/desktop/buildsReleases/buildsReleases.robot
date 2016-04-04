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

Check Builds/Releases
    select frame  name=mainframe
    wait until page contains  Build management
    unselect frame

Create Build
    select frame  name=mainframe
    wait until page contains element  create_build
    click button  create_build
    unselect frame

Check if warning message appears
    select frame  name=mainframe
    execute javascript  var imput = document.getElementsByName('build_name'); imput[0].required = false;
    wait until page contains element  do_create
    click element  do_create
    wait until page contains  Please enter a name for the Build!
    wait until page contains element  xpath=//button[text()="OK"]
    click element  xpath=//button[text()="OK"]
    unselect frame

Fill in the details of the Build
    select frame  name=mainframe
    wait until page contains element  build_name
    wait until page contains  Description
    wait until page contains element  cke_8_label
    click element  cke_8_label
    wait until page contains element  xpath=//*[@id="cke_contents_notes"]/textarea
    input text  xpath=//*[@id="cke_contents_notes"]/textarea  ${Description}
    input text  build_name  ${BuildName}
    unselect frame

Save Build
    select frame  name=mainframe
    wait until page contains element  do_create
    click element  do_create
    unselect frame

Check if Build was created
    select frame  name=mainframe
    wait until page contains  ${BuildName}
    unselect frame

Delete Build
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${BuildName}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame

Fill In Future Release Date
    select frame  mainframe
    wait until page contains element  name=release_date
    input text  release_date  ${ReleaseDate}
    unselect frame
