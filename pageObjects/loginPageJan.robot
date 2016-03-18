*** Settings ***

Documentation  This is the resource file containing all methods based on login page
Library        Selenium2Library


*** Variables ***

${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}      chrome


*** Keywords ***

Open Browser To Login Page
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Capture Page Screenshot
    Title Should Be  TestLink

Go to login page
    go to  ${LOGIN URL}
    Title Should Be  TestLink

Wait until page contains all elements for login
    wait until page contains element  login
    wait until page contains element  tl_password
    wait until page contains element  login_submit
    wait until page contains element  css=div.messages_rounded

Fill correct Login input
    clear element text  login
    input text  login  renat.kulalov

Fill correct Password input
    clear element text  tl_password
    input text  tl_password  renat123

Fill correct credentials and submit
   Fill correct Login input
   Fill correct Password input
   Click Log in Button

Fill incorrect Login input
    clear element text  login
    input text  login  bla


Fill incorrect Password input
    clear element text  tl_password
    input text  tl_password  bla

Fill incorrect credentials and submit
    Fill incorrect Login input
    Fill incorrect Password input
    Click Log in Button

Click Log in Button
    Click Button  login_submit

Check if Login was succesful
    Title Should Be  TestLink 1.9.14 (Padawan)

Check there is no warning about login
    page should not contain  Try again! Wrong login name or password!

Check there is a warning about login
    page should contain  Try again! Wrong login name or password!

Click New user?
    click link  New User?

Click Lost Password?
    click link  Lost Password?

Click Home of TestLink project
    click link  Home

Click License of Testlink
    click link  GNU GPL

Close the browser
    close browser

