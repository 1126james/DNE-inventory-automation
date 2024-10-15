*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Url}        http://localhost:7272
${Browser}    gc
${Username}    demo
${Password}    mode

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Type In Username    ${Username}
    Type In Password    ${Password}
    Submit Credentials
    Welcome Page Should Be Opened
    Logout
    Login Page Should Be Opened
*** Keywords ***
Open Browser To login Page
    Open Browser    ${Url}    ${Browser}

Type In Username
    [Arguments]    ${Username}
    Input Text    id=username_field    ${Username}

Type In Password
    [Arguments]    ${Password}
    Input Password    id=password_field    ${Password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Opened
    Title Should Be    Welcome Page

Logout
    Click Link    link:logout

Login Page Should be Opened
    Title Should Be    Login Page