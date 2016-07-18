*** Settings ***

Documentation  This is the resource file containing all methods based on login page
Library        Selenium2Library


*** Variables ***

${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}      ff




*** Keywords ***

Open Browser To Login Page
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Title Should Be  TestLink

Wait until page contains all elements for login
    wait until page contains element  login
    wait until page contains element  tl_password
    wait until page contains element  login_submit
    wait until page contains element  css=div.messages_rounded

I am here
    wait until page contains element  xpath=//img[@alt="Company logo"]
    wait until page contains element  login
    wait until page contains element  tl_password
    wait until page contains element  login_submit
    wait until page contains element  css=div.messages_rounded
    wait until page contains  New User?
    wait until page contains  Lost Password?
    wait until page contains  Home
    wait until page contains  GNU GPL

Fill credentials and submit ${LOGIN} ${PASSWORD}
    Fill Login ${LOGIN}
    Fill Password ${PASSWORD}
    Click Log in Button

Fill Login ${LOGIN}
    clear element text  login
    input text  login  ${LOGIN}

Fill Password ${PASSWORD}
    clear element text  tl_password
    input text  tl_password  ${PASSWORD}

Click Log in Button
    Click Button  login_submit

Check that warning about empty field appears
    execute javascript  #var imput = document.getElementsByName('tl_login'); imput[0].required = false;
                   ...  var imput2 = document.getElementsByName('tl_password'); imput2[0].required = false;
    click button  login_submit
    wait until page contains  Try again! Wrong login name or password!

Login as admin ${LOGIN} ${PASSWORD}
    loginPage.Open Browser To Login Page
    wait until keyword succeeds  1min  0  loginPage.Wait until page contains all elements for login
    Fill credentials and submit ${LOGIN} ${PASSWORD}


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